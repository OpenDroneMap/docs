Multispectral Support
=====================

Since version 0.9.9 ODM has basic support for radiometric normalization, which is able to generate reflectance orthophotos from multispectral cameras. Multispectral cameras capture multiple shots of the scene using different band sensors.

Hardware
--------

While we aim to support as many cameras as possible, multispectral support has been developed using the following cameras, so they will work better:

 * `MicaSense RedEdge-MX and Altum <https://www.micasense.com/>`_
 * `Sentera 6X <https://sentera.com/data-capture/6x-multispectral/>`_

Other cameras might also work. You can help us expand this list by `sharing datasets <https://community.opendronemap.org/c/datasets/10>`_ captured with other cameras.

Usage
-----

Process all the images from all bands at once (do not separate the bands into multiple folders) and pass the `--radiometric-calibration` parameter to enable radiometric normalization. If the images are part of a multi-camera setup, the resulting orthophoto will have N bands, one for each camera (+ alpha).


`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/multispectral.rst>`_!


Sentera AGX710
--------------

While this sensor is not officially supported by ODM, the following workflow gives some good results.

 * all JPGs from the NDRE directory should be renamed with the exact following pattern 0000X_NIR.jpg. No extra '_' should be present in the file names ie 10_51_14_IMG_00008.jpg => 00008_NIR.jpg
 * all JPGs from the nRGB directory should be renamed with the exact following pattern 0000X_RGB.jpg. No extra '_' should be present in the file names ie 10_51_14_IMG_00023.jpg => 00023_RGB.jpg
 * All renamed XXXX_NIR.jpg and XXXX_RGB.jpg should be placed in the same folder
 * The following command could be used to create an odm_orthophoto.tif file

::

 docker run  --rm -v  input_image_dir/:/code/images \
 -v output_dir/odm_georeferencing:/code/odm_georeferencing  \
 -v output_dir/odm_orthophoto:/code/odm_orthophoto \
 -v output_dir/odm_report:/code/odm_report \
 opendronemap/odm --auto-boundary

* After the successful ODM processing, odm_orthophoto.tif bands names could be accurately renamed using contrib/ndvi/rename_sentera_agx710_multispectral_tif.py script

::

 python3 contrib/ndvi/rename_sentera_agx710_multispectral_tif.py  output_dir/odm_orthophoto.tif 

* output_dir/odm_orthophoto.tif could be open with `QGIS <https://qgis.org/>`_ with correct band names 
