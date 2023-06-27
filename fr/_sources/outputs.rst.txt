OpenDroneMap Outputs
====================

Listed below are some of the useful outputs ODM produces.

Point Cloud
^^^^^^^^^^^

``odm_georeferencing/odm_georeferenced_model.ply/laz/csv`` -- The georeferenced point cloud in different file formats

.. figure:: images/pointcloud.png
   :alt: image of OpenDroneMap derived point cloud
   :align: center
   
*Point cloud over State University Zanzibar, courtesy of* `Khadija Abdullah Ali <https://www.linkedin.com/in/khadija-abdulla-ali-56b4044a/>`_


3D Textured Model
^^^^^^^^^^^^^^^^^

``odm_texturing/odm_textured_model.obj`` -- The textured surface mesh
``odm_texturing/odm_textured_model_geo.obj`` -- The georeferenced and textured surface mesh

You can access the point cloud and textured meshes using MeshLab. Open MeshLab, and choose File:Import Mesh and choose your textured mesh from a location similar to the following: ``odm_texturing\odm_textured_model.obj``

.. figure:: images/UR_3D.gif
   :alt: image of OpenDroneMap derived textured mesh
   :align: center
   
*Textured mesh courtesy of* `OpenDroneMap <https://twitter.com/opendronemap>`_

Orthophoto
^^^^^^^^^^

``odm_orthophoto/odm_orthphoto.tif`` -- GeoTIFF Orthophoto. You can use it in QGIS as a raster layer.

``odm_orthophoto/odm_orthphoto.original.tif`` -- The orthophoto in its original un-cropped state.

.. figure:: images/orthophoto.png
   :alt: image of OpenDroneMap orthophoto
   :align: center

*Orthophoto over State University Zanzibar, courtesy of* `Khadija Abdullah Ali <https://www.linkedin.com/in/khadija-abdulla-ali-56b4044a/>`_

DTM/DSM
^^^^^^^

DTM/DSM will only be created if the ``--dtm`` or ``--dsm`` options are used. See `tutorial on elevation models <https://docs.opendronemap.org/tutorials.html#creating-digital-elevation-models>`_ for more options in creating.

Data will be stored in:

 * ``odm_dem/dtm.tif``
 * ``odm_dem/dsm.tif``

.. figure:: images/digitalsurfacemodel.png
   :alt: image of OpenDroneMap derived digital surface model
   :align: center
   
*Digital surface model over State University Zanzibar, courtesy of* `Khadija Abdullah Ali <https://www.linkedin.com/in/khadija-abdulla-ali-56b4044a/>`_

Logs
^^^^
Logs are output to stdout. On Linux `ANSI escape color code <https://en.wikipedia.org/wiki/ANSI_escape_code>`_ (eg ^[[39m)  is used and could be disabled by setting no_ansiesc environment variable to any value like ``env no_ansiesc=1``


List of all outputs
^^^^^^^^^^^^^^^^^^^

::

    project/
    ├── images/
    │   ├── img-1234.jpg
    │   └── ...
    ├── opensfm/                            # Tie Points and camera positions here in JSON format
    │   ├── config.yaml
    │   ├── images/
    │   ├── masks/
    │   ├── gcp_list.txt
    │   ├── metadata/
    │   ├── features/
    │   ├── matches/
    │   ├── tracks.csv
    │   ├── reconstruction.json
    │   ├── reconstruction.meshed.json
    │   ├── undistorted/
    │   ├── undistorted_tracks.json
    │   ├── undistorted_reconstruction.json
    │   └── depthmaps/
    │      └── merged.ply                   # Dense Point Cloud
    ├── odm_meshing/
    │   ├── odm_mesh.ply                    # A 3D mesh
    │   └── odm_meshing_log.txt             # Output of the meshing task. May point out errors.
    ├── odm_texturing/
    │   ├── odm_textured_model.obj          # Textured mesh
    │   ├── odm_textured_model_geo.obj      # Georeferenced textured mesh
    │   └── texture_N.jpg                   # Associated textured images used by the model
    ├── odm_georeferencing/
    │   ├── odm_georeferenced_model.ply     # A georeferenced dense point cloud
    │   ├── odm_georeferenced_model.laz # LAZ format point cloud
    │   ├── odm_georeferenced_model.csv     # XYZ format point cloud
    │   ├── odm_georeferencing_log.txt      # Georeferencing log
    │   └── odm_georeferencing_utm_log.txt  # Log for the extract_utm portion
    ├── odm_orthophoto/
    │   ├── odm_orthophoto.png              # Orthophoto image (no coordinates)
    │   ├── odm_orthophoto.tif              # Orthophoto GeoTiff
    │   ├── odm_orthophoto_log.txt          # Log file
    │   └── gdal_translate_log.txt          # Log for georeferencing the png file
    └── odm_dem/
        ├── dsm.tif                     # Digital Surface Model Geotiff - the tops of everything
        └── dtm.tif                     # Digital Terrain Model Geotoff - the ground.



`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/outputs.rst>`_!
