########################
High Precision Workflows
########################

************
Map accuracy
************

Accuracy can be defined as the degree or closeness to which the information on a map matches the values in the real world. Therefore, when we refer to accuracy, we are talking about quality of data and about number of errors contained in a certain dataset (Pascual 2011). 


**Relative or Local accuracy**

Local or relative accuracy can be defined as the degree to which de distances between two points on a map correspond to the actually distances between those points in the real world. 

Relative accuracy is independent of the location of the map in the world, so a map can have a high relative accuracy (in size and shape) but its position in the world can be shifted (Figure 1). 

.. figure:: images/rel_accuracy.png
   :alt: Model showing high relative accuracy
   :align: center
   
*Figure 1. Model showing high relative accuracy but misplaced according to its real world position*



**Absolute or global Accuracy** 

Absolute accuracy is the accuracy of the reconstruction in relation to its true position on the planet (Pix4D 2019). Figure 2 shows a relative and absolute accurate model, as the points are correctly placed according to its real world position. 

.. figure:: images/abs_accuracy.png
   :alt: Model showing high absolute accuracy
   :align: center

*Figure 2. Model showing high relative and absolute accuracy. Placed correctly according to its real world position*


**An Accuracy level for each project**

Each project has specific accuracy needs to be met. For instance assessing the progress in a construction site or measuring an area affected by a fire does not require the use of GCP, since absolute accuracy will not impact the decision making process. In the other hand, there are tasks on which accuracy is critical, for example project compliance evaluations and land title surveying, which require a higher relative and absolute accuracy. 

--------------
What to expect 
--------------

In general terms, one can expect the relative accuracy to be in the order of 1 to 3 times the average GSD for the dataset. And as for the absolute accuracy, one must consider that it is dependent of the GPS unit mounted in the UAV but the horizontal accuracy of a standard GPS is usually in the range of 2 to 6 meters and the vertical accuracy between 3 to 4 times the horizontal accuracy. 

When using GCP, absolute accuracy can be improved to 2.5 times GSD for the horizontal accuracy and 4 times the GSD for the vertical accuracy (Madawalagama 2016). 

At a GSD of 1cm, the accuracy is to that of the RTK GNSS, and is within 1:200 scales according to NSDI & FGDC mapping accuracy standards during sub-optimal conditions (Barry 2013). 

------------------------------
Aspects impacting map accuracy 
------------------------------

**Weather**

Weather conditions have direct impact in the photogrammetry results, so it is important to consider cloud coverage, wind speed, humidity, sun’s altitude and other factors influencing the UAV stability and terrain illumination. 

**Cameras**

Bigger and better sensors produce less noise and more clearly focused images. Also consider that rolling shutter cameras produce distorted images when the UAV is moving, so global or mechanical shutter cameras are advised for mapping jobs. 


**Flight altitude**

The higher the flight altitude, the larger the image footprint and GSD. The resulting larger GSD the accuracy will be decreased as there will be less detail in the recognizable features. When a smaller GSD is required an altitude of 3 to 4 times the height of the highest point is recommended. 


**Flight speed**

Flight speed have special effect in cameras equipped with rolling shutter, while those equipped with global or mechanical shutter tends to reduce this effect. UAV equipped with RTK positioning systems are also affected with the speed, but with hover at each photo taken, you can get very good accuracy. If instead you are moving during each photo take, the accuracy is going to be limited by two factors: the speed at which you are moving multiplied by the 1 second increments of RTK (Mather 2020). 

----------
References
----------

Barry, P., & Coakley, R. «Accuracy of UAV photogrammetry compared with Network RTK GPS.» Baseline Surveys. 2013. http://uav.ie/PDF/Accuracy_UAV_compare_RTK_GPS.pdf  (accessed 10 13, 2020). 

Drone Deploy. How Do I Use Ground Control Points?: A guide to using ground control points with drone mapping software. 5 8, 2017. https://www.dronedeploy.com/blog/what-are-ground-control-points-gcps/ (accessed 7 9, 2020). 

Madawalagama, S.L., Munasinghe, N., Dampegama, S.D.P.J. and Samarakoon, L. «Low-cost aerial mapping with consumer grade.» 37th Asian Conference on Remote Sensing. Colombo, Sri Lanka, 2016. 

Mather, Stephen. OpenDroneMap. 30 de Marzo de 2020. https://community.opendronemap.org/t/the-accuracy-of-webodm-using-rtk-uavs/3937 (accessed 10 12, 2020). 

Pascual, Manuel S. GIS Lounge: GIS Data: A Look at Accuracy, Precision, and Types of Errors. 11 6, 2011. https://www.gislounge.com/gis-data-a-look-at-accuracy-precision-and-types-of-errors/ (accessed 07 09, 2020). 

Pix4D. «What is accuracy in an aerial mapping project?» Pix4D. 25 de 05 de 2019. https://www.pix4d.com/blog/accuracy-aerial-mapping (accessed 10 13, 2020). 

*********************
Ground Control Points
*********************

--------
Overview
--------

Ground control points are useful for correcting distortions in the data and referencing the data to know coordinate systems.

A Ground Control Point (GCP) is a position measurement made on the ground, typically using a high precision GPS. (Toffanin 2019)

Ground control points can be set existing structures like pavement corners, lines on a parking lot or contrasting color floor tiles, otherwise can be set using targets placed on the ground.

Targets can be purchased or build with an ample variety of materials ranging from bucket lids to floor tiles.


Recommended practices for GCP setting
-------------------------------------

Keep ground control points visible for all camera locations. Consider the expected ground sampling distance, illumination, vegetation, buildings and all the existing obstacles.

Procure an evenly horizontal distribution of the GCPs within the project, covering high and low elevations. A minimum of 5 GCP works for most of the jobs, and for larger projects 8 â€“ 10 are sufficient. Locate some points near the corners and others in the center, considering that GCP spacing should be larger than the image footprint so that you canâ€™t see more than one GCP in a single image.

In order to ensure each GCP are found in at least 5 images, separate the points 10 to 30 meters from the perimeter of the project. This distance is dependent of the overlapping, so increasing overlapping should reduce the required distance from the perimeter.

GCP file format
---------------

The format of the GCP file is simple.

	 * The first line should contain the name of the projection used for the geo coordinates. This can be specified either as a PROJ string (e.g. ``+proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +no_defs``), EPSG code (e.g. ``EPSG:4326``) or as a ``WGS84 UTM <zone>[N|S]`` value (eg. ``WGS84 UTM 16N``)
 	 * Subsequent lines are the X, Y & Z coordinates, your associated pixels, the image filename and optional extra fields, separated by tabs or spaces:
 	 * Avoid setting elevation values to "NaN" to indicate no value. This can cause processing failures. Instead use 0.0
         * Similarly decreasing the no. of digits after the decimal place for `geo_x` and `geo_y` can also reduce processing failures.
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

---------------
User Interfaces
---------------

You can use one of two user interfaces for creating GCP files:

	* `POSM GCPi <https://github.com/posm/posm-gcpi>`_
	* `GCP Editor Pro <https://github.com/uav4geo/GCPEditorPro>`_

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

----------
References
----------

Toffanin, Piero. `Open Drone Map: The Missing Guide. <https://odmbook.com/>`_ MasseranoLabs LLC, 2019.

***********************
Image Geolocation Files
***********************

By default ODM will use the GPS information embedded in the images, if it is available. Sometimes images do not contain GPS information, or a user wishes to override the information with more accurate data (such as RTK).

Starting from ODM ``2.0`` people can supply an image geolocation file (geo) for this purpose.

The format of the image geolocation file is simple.

	 * The first line should contain the name of the projection used for the geo coordinates. This can be specified either as a PROJ string (e.g. ``+proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +no_defs``), EPSG code (e.g. ``EPSG:4326``) or as a ``WGS84 UTM <zone>[N|S]`` value (eg. ``WGS84 UTM 16N``)
 	 * Subsequent lines are the image filename, X, Y & Z (optional) coordinates, the camera angles (optional, currently used only for radiometric calibration) and the horizontal/vertical accuracy (optional):
 	 * Camera angles can be set to ``0`` if they are not available.
 	 * The 10th column (optional) can contain extra fields, such as a label.

File format::

    <projection>
    image_name geo_x geo_y [geo_z] [yaw (degrees)] [pitch (degrees)] [roll (degrees)] [horz accuracy (meters)] [vert accuracy (meters)] [extras...]
    ...

Example::

    EPSG:4326
    DJI_0028.JPG    -91.9942096111111   46.84252125 198.609
    DJI_0032.JPG    -91.9938293055556   46.8424584444444    198.609



If you supply a file called ``geo.txt`` then ODM will automatically detect it. If it has another name you can specify using ``--geo <path>``.

The ``geo.txt`` file must be created in the base of your project folder or when using WebODM, uploaded with the raw jpg or tif input files.

****************************
Improving relative accuracy
****************************

Georeferencing by default is done using GPS (GNSS) or GCPs (if provided).

Starting from ODM ``3.0.2`` people can supply a reference alignment file to georeference the program outputs. The reconstruction will be initially performed using GPS/GCPs and will subsequently be aligned to the reference model via a linear scaling/rotation/shift operation.

If you supply a file called ``align.laz``, ``align.las`` or ``align.tif`` (single band GeoTIFF DEM) then ODM will automatically detect it and attempt to align outputs to this reference model. If it has another name you can specify using ``--align <path>``.

The alignment file must be created in the base of your project folder. The base folder is usually where you have stored your images. If you are using WebODM or NodeODM, then upload the align file with your images. If resizing your images in WebODM, use an ``align.laz`` or ``align.las`` file instead of a tif.

-----------------------
Multi-temporal Datasets
-----------------------

When previously mapped sites need revisited, OpenDroneMap can align multiple versions of a dataset through time by using a prior point cloud or digital elevation model. As the prior point cloud `seems to provide better results <https://community.opendronemap.org/t/tips-to-increase-same-site-temporal-consistency/22161/7>`_, that is the approach we will review here.

**Workflow for multi-temporal datasets:**

#. Process your original data. This step doesn't require a ground control point file, but use one if absolute accuracy is a project requirement
#. Download the Point Cloud from your first processed dataset as an LAZ file type (default). Rename the point cloud to align.laz
#. Include that LAZ file with each of your subsequent processing. If you are using command line ODM, include it in the images directory. If uploading, simply upload with your raw images for processing
#. Check your log. It should include a line near the top that indicates it has set align to a path value, something like this::

    [INFO]    Initializing ODM 3.5.3 - Tue Oct 15 05:01:43  2024
    [INFO]    ==============
    [INFO]    3d_tiles: False
    [INFO]    align: /var/www/data/bc14fa2c-ba5c-4b85-99b0-0b7ff715b210/gcp/align.laz
    [INFO]    auto_boundary: True

**Output example for aligned datasets:**

.. figure:: images/align_pc.gif
   :alt: Animated gif comparing two separately processed, but aligned digital surface models.
   :align: center

Animated gif comparing two separately processed, but aligned digital surface models.


`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/map-accuracy.rst>`_!
