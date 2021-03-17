#####################
Ground Control Points
#####################

Ground control points are useful for correcting distortions in the data and referencing the data to know coordinate systems.

A Ground Control Point (GCP) is a position measurement made on the ground, typically using a high precision GPS. (Toffanin 2019) 

Ground control points can be set existing structures like pavement corners, lines on a parking lot or contrasting color floor tiles, otherwise can be set using targets placed on the ground. 

Targets can be purchased or build with an ample variety of materials ranging from bucket lids to floor tiles.

*************************************
Recommended practices for GCP setting
*************************************

Keep ground control points visible for all camera locations. Consider the expected ground sampling distance, illumination, vegetation, buildings and all the existing obstacles. 

Procure an evenly horizontal distribution of the GCPs within the project, covering high and low elevations. A minimum of 5 GCP works for most of the jobs, and for larger projects 8 – 10 are sufficient. Locate some points near the corners and others in the center, considering that GCP spacing should be larger than the image footprint so that you can’t see more than one GCP in a single image. 

In order to ensure each GCP are found in at least 5 images, separate the points 10 to 30 meters from the perimeter of the project. This distance is dependent of the overlapping, so increasing overlapping should reduce the required distance from the perimeter. 

***************
GCP file format
***************

The format of the GCP file is simple.

	 * The first line should contain the name of the projection used for the geo coordinates. This can be specified either as a PROJ string (e.g. ``+proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +no_defs``), EPSG code (e.g. ``EPSG:4326``) or as a ``WGS84 UTM <zone>[N|S]`` value (eg. ``WGS84 UTM 16N``)
 	 * Subsequent lines are the X, Y & Z coordinates, your associated pixels, the image filename and optional extra fields, separated by tabs or spaces:
 	 * Elevation values can be set to "NaN" to indicate no value
 	 * The 7th column (optional) typically contains the label of the GCP. 

GCP file format::

    <projection>
    geo_x geo_y geo_z im_x im_y image_name [gcp_name] [extra1] [extra2]
    ...

Example::

    +proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +no_defs
    544256.7 5320919.9 5 3044 2622 IMG_0525.jpg
    544157.7 5320899.2 5 4193 1552 IMG_0585.jpg
    544033.4 5320876.0 5 1606 2763 IMG_0690.jpg

If you supply a GCP file called ``gcp_list.txt`` then ODM will automatically detect it. If it has another name you can specify using ``--gcp <path>``. If you have a gcp file and want to do georeferencing with exif instead, then you can specify ``--use-exif``. If you have high precision GPS measurements in your images (RTK) and want to use that information along with a gcp file, you can specify ``--force-gps``.

`This post has some information about placing Ground Control Targets before a flight <http://diydrones.com/profiles/blogs/ground-control-points-gcps-for-aerial-photography>`_, but if you already have images, you can find your own points in the images post facto. It's important that you find high-contrast objects that are found in **at least** 3 photos, and that you find a minimum of 5 objects.

Sharp corners are good picks for GCPs. You should also place/find the GCPs evenly around your survey area.

The ``gcp_list.txt`` file must be created in the base of your project folder.

For good results your file should have a minimum of 15 lines after the header (5 points with 3 images to each point).

***************
User Interfaces
***************

You can use one of two user interfaces for creating GCP files:

	* `POSM GCPi <https://github.com/posm/posm-gcpi>`_
	* `GCP Editor Pro <https://github.com/uav4geo/GCPEditorPro>`_

---------
POSM GCPi
---------

The POSM GCPi is loaded by default on WebODM. An example is available at `the WebODM Demo <http://demo.webodm.org/plugins/posm-gcpi/>`_. To use this with known ground control XYZ values, one would do the following:

Create a GCP list that only includes gcp name (this is the label that will be seen in the GCP interface), x, y, and z, with a header with a proj4 string of your GCPs (make sure they are in a planar coordinate system, such as UTM. It should look something like this:

::

	+proj=utm +zone=37 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs
	gcp01 529356.250827686 9251137.5643209 8.465
	gcp02 530203.125367657 9250140.80991621 15.781
	gcp03 530292.136003818 9250745.02372435 11.977
	gcp04 530203.125367657 9250140.80991621 15.781
	gcp05 530292.136003818 9250745.02372435 11.977

Then one can load this GCP list into the interface, load the images, and place each of the GCPs in the image.

--------------
GCP Editor Pro
--------------

This app needs to be installed separately or can be loaded as a WebODM plugin from `https://github.com/uav4geo/GCPEditorPro <https://github.com/uav4geo/GCPEditorPro>`_

Create a CSV file that includes the gcp name, northing, easting and elevation.

::

    GCP Label,Northing,Easting,Elevation
    gcp01,529356.250827686,9251137.5643209,8.465
    gcp02,530203.125367657,9250140.80991621,15.781
    ...

Then import the CSV from the main screen and type ``+proj=utm +zone=37 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs`` in the ``EPSG/PROJ`` box.

The following screen will display a map from where to select the GCPs to tag and import the respective images.

**********
References
**********

Toffanin, Piero. `Open Drone Map: The Missing Guide. <https://odmbook.com/>`_ MasseranoLabs LLC, 2019.


`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/gcp.rst>`_!
