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

Bowling effect on point cloud over 13,000+ image dataset collected by World Bank Tanzania over the flood prone Msimbasi Basin, Dar es Salaam, Tanzania.

To mitigate this effect, there are a few options but the simplest are as follows: fly two patterns separated by 20°, and rather than having a nadir (straight down pointing) camera, use one that tilts forward by 5°.

.. figure:: images/flightplanning.gif
  :alt: animation showing optimum
  :align: center
  :height: 480
  :width: 640

As this approach to flying can be take longer than typical flights, a pilot or team can fly a small area using the above approach. OpenDroneMap will generate a calibration file called cameras.json that then can be imported to be used to calibrate another flight that is more efficiently flown.

Vertically separated flight lines also improve accuracy, but less so than a camera that is forward facing by 5°.

.. figure:: images/forward_facing.png
   :alt: figure showing effect of vertically separated flight lines and forward facing cameras on improving self calibration
   :align: center

From James and Robson (2014), `CC BY 4.0 <https://creativecommons.org/licenses/by/4.0/>`_

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

