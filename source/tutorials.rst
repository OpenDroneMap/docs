.. Tutorials

Tutorials
=========

Below you will find instructions for some common use cases.

Creating High Quality Orthophotos
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/orthophoto.png
   :alt: image of OpenDroneMap orthophoto
   :align: center

Without any parameter tweaks, ODM chooses a good compromise between quality, speed and memory usage. If you want to get higher quality results, you need to tweak some parameters:

 * ``--orthophoto-resolution`` is the resolution of the orthophoto in cm/pixel. Decrease this value for a higher resolution result.
 * ``--ignore-gsd`` is a flag that instructs ODM to skip certain memory and speed optimizations that directly affect the orthophoto. Using this flag will increase runtime and memory usage, but will produce sharper results.
 * ``--texturing-nadir-weight`` should be increased to ``29-32`` in urban areas to reconstruct better edges of roofs. It should be decreased to ``0-6`` in grassy / flat areas.
 * ``--texturing-data-term`` should be set to `area` in forest areas.
 * ``--mesh-size`` should be increased to `300000-600000` and `--mesh-octree-depth`` should be increased to `10-11` in urban areas to recreate better buildings / roofs.

Calibrating the Camera
^^^^^^^^^^^^^^^^^^^^^^

Camera calibration is a special challenge with commodity cameras. Temperature changes, vibrations, focus, and other factors can affect the derived parameters with substantial effects on resulting data. Automatic or self calibration is possible and desirable with drone flights, but depending on the flight pattern, automatic calibration may not remove all distortion from the resulting products. James and Robson (2014) in their paper `Mitigating systematic error in topographic models derived from UAV and ground‐based image networks <https://onlinelibrary.wiley.com/doi/full/10.1002/esp.3609>`_ address how to minimize the distortion from self-calibration.

.. figure:: images/msimbasi_bowling.png
   :alt: image of lens distortion effect on bowling of data
   :align: center

*Bowling effect on point cloud over 13,000+ image dataset collected by World Bank Tanzania over the flood prone Msimbasi Basin, Dar es Salaam, Tanzania.*

To mitigate this effect, there are a few options but the simplest are as follows: fly two patterns separated by 20°, and rather than having a nadir (straight down pointing) camera, use one that tilts forward by 5°.

.. figure:: images/flightplanning.gif
  :alt: animation showing optimum
  :align: center
  :height: 480
  :width: 640

As this approach to flying can be take longer than typical flights, a pilot or team can fly a small area using the above approach. OpenDroneMap will generate a calibration file called cameras.json that then can be imported to be used to calibrate another flight that is more efficiently flown.

Alternatively, the following experimental method can be applied: fly with much lower overlap, but two *crossgrid* flights (sometimes called crosshatch) separated by 20° with a 5° forward facing camera.

* To get good 3D results, you will require 83% equivalent overlap and sidelap, which for a pair of crossgrids using 68% overlap and sidelap will achieve this.
* To get good 2D and 2.5D (digital elevation model) results, you will need 42% overlap and sidelap for an equivalent 70% overlap and sidelap.

.. figure:: images/rotation.gif
  :alt: animation showing experimental optimum
  :align: center

Vertically separated flight lines also improve accuracy, but less so than a camera that is forward facing by 5°.

.. figure:: images/forward_facing.png
   :alt: figure showing effect of vertically separated flight lines and forward facing cameras on improving self calibration
   :align: center

*From James and Robson (2014), `CC BY 4.0 <https://creativecommons.org/licenses/by/4.0/>`_*

Creating Digital Elevation Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By default ODM does not create DEMs. To create a digital terrain model, make sure to pass the ``--dtm`` flag. To create a digital surface model, be sure to pass the ``--dsm`` flag.

.. figure:: images/digitalsurfacemodel.png
   :alt: image of OpenDroneMap derived digital surface model
   :align: center

For DTM generation, a Simple Morphological Filter (smrf) is used to classify points in ground vs. non-ground and only the ground points are used. The ``smrf`` filter can be controlled via several parameters:

 * ``--smrf-scalar`` scaling value. Increase this parameter for terrains with lots of height variation.
 * ``--smrf-slope`` slope parameter, which is a measure of "slope tolerance". Increase this parameter for terrains with lots of height variation. Should be set to something higher than 0.1 and not higher than 1.2.
 * ``--smrf-threshold`` elevation threshold. Set this parameter to the minimum height (in meters) that you expect non-ground objects to be.
 * ``--smrf-window`` window radius parameter (in meters) that corresponds to the size of the largest feature (building, trees, etc.) to be removed. Should be set to a value higher than 10.

Changing these options can affect the result of DTMs significantly. The best source to read to understand how the parameters affect the output is to read the original paper `An improved simple morphological filter for the terrain classification of airborne LIDAR data <https://www.researchgate.net/publication/258333806_An_Improved_Simple_Morphological_Filter_for_the_Terrain_Classification_of_Airborne_LIDAR_Data>`_ (PDF freely available).

Overall the ``--smrf-threshold`` option has the biggest impact on results.

SMRF is good at avoiding Type I errors (small number of ground points mistakenly classified as non-ground) but only "acceptable" at avoiding Type II errors (large number non-ground points mistakenly classified as ground). This needs to be taken in consideration when generating DTMs that are meant to be used visually, since objects mistaken for ground look like artifacts in the final DTM.

.. figure:: images/smrf.png
   :alt: image of lens distortion effect on bowling of data
   :align: center

Two other important parameters affect DEM generation:

 * ``--dem-resolution`` which sets the output resolution of the DEM raster (cm/pixel)
 * ``--dem-gapfill-steps`` which determines the number of progressive DEM layers to use. For urban scenes increasing this value to `4-5` can help produce better interpolation results in the areas that are left empty by the SMRF filter.

Example of how to generate a DTM::

    docker run -ti --rm -v /my/project:/datasets/code <my_odm_image> --project-path /datasets --dtm --dem-resolution 2 --smrf-threshold 0.4 --smrf-window 24

.. _ground-control-points:

Ground Control Points
^^^^^^^^^^^^^^^^^^^^^

Ground control points are useful for correcting distortions in the data and referencing the data to know coordinate systems.

	The format of the GCP file is simple.

	 * The header line is a description of a UTM coordinate system, which must be written as a proj4 string. http://spatialreference.org/ is a good resource for finding that information. Please note that currently angular coordinates (like lat/lon) DO NOT work.
	 * Subsequent lines are the X, Y & Z coordinates, your associated pixels and the image filename:

	GCP file format::

	    <proj4 string>
	    <geo_x> <geo_y> <geo_z> <im_x> <im_y> <image_name>
	    ...

	e.g. for the Langley dataset::

	    +proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +no_defs
	    544256.7 5320919.9 5 3044 2622 IMG_0525.jpg
	    544157.7 5320899.2 5 4193 1552 IMG_0585.jpg
	    544033.4 5320876.0 5 1606 2763 IMG_0690.jpg

	If you supply a GCP file called gcp_list.txt then ODM will automatically detect it. If it has another name you can specify using ``--gcp <path>``. If you have a gcp file and want to do georeferencing with exif instead, then you can specify ``--use-exif``.

	`This post has some information about placing Ground Control Targets before a flight <http://diydrones.com/profiles/blogs/ground-control-points-gcps-for-aerial-photography>`_, but if you already have images, you can find your own points in the images post facto. It's important that you find high-contrast objects that are found in **at least** 3 photos, and that you find a minimum of 5 objects.

	Sharp corners are good picks for GCPs. You should also place/find the GCPs evenly around your survey area.

	The ``gcp_list.txt`` file must be created in the base of your project folder.

	For good results your file should have a minimum of 15 lines after the header (5 points with 3 images to each point).

Ground Control Points Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

WebODM has a GCP interface, and example of which can be seen on `the WebODM Demo <http://demo.webodm.org/plugins/posm-gcpi/>`_. To use this with known ground control XYZ values, one would do the following:

Create a GCP list that only includes gcp name (this is the label that will be seen in the GCP interface), x, y, and z, with a header with a proj4 string of your GCPs (make sure they are in a planar coordinate system, such as UTM. It should look something like this:

::

	+proj=utm +zone=37 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs
	gcp01 529356.250827686 9251137.5643209 8.465
	gcp02 530203.125367657 9250140.80991621 15.781
	gcp03 530292.136003818 9250745.02372435 11.977
	gcp04 530203.125367657 9250140.80991621 15.781
	gcp05 530292.136003818 9250745.02372435 11.977

Then one can load this GCP list into the interface, load the images, and place each of the GCPs in the image.

`Help edit these docs! <https://github.com/OpenDroneMap/docs/blob/publish/source/using.rst>`_

Using Docker
^^^^^^^^^^^^

Since many users employ docker to deploy OpenDroneMap, it can be useful to understand some basic commands in order to interrogate the docker instances when things go wrong, or we are curious about what is happening. Docker is a containerized environment intended, among other things, to make it easier to deploy software independent of the local environment. In this way, it is similar to virtual machines.

A few simple commands can make our docker experience much better.

Listing Docker Machines
-----------------------

We can start by listing available docker machines on the current machine we are running as follows:

::

    > docker ps
    CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                    NAMES
    2518817537ce        opendronemap/odm       "bash"                   36 hours ago        Up 36 hours                                  zen_wright
    1cdc7fadf688        opendronemap/nodeodm   "/usr/bin/nodejs /va…"   37 hours ago        Up 37 hours         0.0.0.0:3000->3000/tcp   flamboyant_dhawan

If we want to see machines that may not be running but still exist, we can add the `-a` flag:

::

    > docker ps -a
    CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS                    PORTS                    NAMES
    2518817537ce        opendronemap/odm       "bash"                   36 hours ago        Up 36 hours                                        zen_wright
    1cdc7fadf688        opendronemap/nodeodm   "/usr/bin/nodejs /va…"   37 hours ago        Up 37 hours               0.0.0.0:3000->3000/tcp   flamboyant_dhawan
    cd7b9585b8f6        opendronemap/odm       "bash"                   3 days ago          Exited (1) 37 hours ago                            nostalgic_lederberg
    e31010c00b9a        opendronemap/odm       "python /code/run.py…"   3 days ago          Exited (2) 3 days ago                              suspicious_kepler
    c44e0d0b8448        opendronemap/nodeodm   "/usr/bin/nodejs /va…"   3 days ago          Exited (0) 37 hours ago                            wonderful_burnell

Accessing logs on the instance
------------------------------

Using either the `CONTAINER ID` or the name, we can access any logs available on the machine as follows:

::

    > docker logs 2518817537ce

This is likely to be unwieldy large, but we can use a pipe `|` character and other tools to extract just what we need from the logs. For example we can move through the log slowly using the `more` command:

::

    > docker logs 2518817537ce | more
    [INFO]    DTM is turned on, automatically turning on point cloud classification
    [INFO]    Initializing OpenDroneMap app - Mon Sep 23 01:30:33  2019
    [INFO]    ==============
    [INFO]    build_overviews: False
    [INFO]    camera_lens: auto
    [INFO]    crop: 3
    [INFO]    debug: False
    [INFO]    dem_decimation: 1
    [INFO]    dem_euclidean_map: False
    ...

Pressing `Enter` or `Space`, arrow keys or `Page Up` or `Page Down` keys will now help us navigate through the logs. The lower case letter `Q` will let us escape back to the command line.

We can also extract just the end of the logs using the `tail` commmand as follows:

::

    > docker logs 2518817537ce | tail -5
    [INFO]    Cropping /datasets/code/odm_orthophoto/odm_orthophoto.tif
    [INFO]    running gdalwarp -cutline /datasets/code/odm_georeferencing/odm_georeferenced_model.bounds.gpkg -crop_to_cutline -co NUM_THREADS=8 -co BIGTIFF=IF_SAFER -co BLOCKYSIZE=512 -co COMPRESS=DEFLATE -co BLOCKXSIZE=512 -co TILED=YES -co PREDICTOR=2 /datasets/code/odm_orthophoto/odm_orthophoto.original.tif /datasets/code/odm_orthophoto/odm_orthophoto.tif --config GDAL_CACHEMAX 48.95%
    Using band 4 of source image as alpha.
    Creating output file that is 111567P x 137473L.
    Processing input file /datasets/code/odm_orthophoto/odm_orthophoto.original.tif.

The value `-5` tells the tail command to give us just the last 5 lines of the logs.

Command line access to instances
--------------------------------

Sometimes we need to go a little deeper in our exploration of the process for OpenDroneMap. For this, we can get direct command line access to the machines. For this, we can use `docker exec` to execute a `bash` command line shell in the machine of interest as follows:

::

    > docker exec -ti 2518817537ce bash
    root@2518817537ce:/code#

Now we are logged into our docker instance and can explore the machine.

Cleaning up after Docker
------------------------

Docker has a lamentable use of space and by default does not clean up excess data and machines when processes are complete. This can be advantageous if we need to access a process that has since terminated, but carries the burden of using increasing amounts of storage over time. The Maciej Łebkowski has an `excellent overview of how to manage excess disk usage in docker <https://lebkowski.name/docker-volumes/>`_.
