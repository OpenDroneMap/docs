#######################
Image Geolocation Files
#######################

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

The ``geo.txt`` file must be created in the base of your project folder.


`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/geo.rst>`_!
