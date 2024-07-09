###############
Alignment Files
###############

Georeferencing by default is done using GPS or GCPs (if provided).

Starting from ODM ``3.0.2`` people can supply a reference alignment file to georeference the program outputs. The reconstruction will be initially performed using GPS/GCPs and will subsequently be aligned to the reference model via a linear scaling/rotation/shift operation. 

If you supply a file called ``align.laz``, ``align.las`` or ``align.tif`` (single band GeoTIFF DEM) then ODM will automatically detect it and attempt to align outputs to this reference model. If it has another name you can specify using ``--align <path>``.

The alignment file must be created in the base of your project folder. The base folder is usually where you have stored your images.

`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/align.rst>`_!
