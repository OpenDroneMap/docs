Multispectral Support
=====================

Since version 0.9.9 ODM has basic support for radiometric normalization, which is able to generate reflectance orthophotos from multispectral cameras. Multispectral cameras capture multiple shots of the scene using different band sensors.

Hardware
--------

While we aim to support as many cameras as possible, multispectral support has been developed using the following cameras, so they will work better:

 * `MicaSense RedEdge-MX and Altum <https://www.micasense.com/>`_
 * `Sentera 6X <https://sentera.com/6x/>`_

Other cameras might also work. You can help us expand this list by `sharing datasets <https://community.opendronemap.org/c/datasets/10>`_ captured with other cameras.

Usage
-----

Process all the images from all bands at once (do not separate the bands into multiple folders) and pass the `--radiometric-calibration` parameter to enable radiometric normalization. If the images are part of a multi-camera setup, the resulting orthophoto will have N bands, one for each camera (+ alpha).





`Help edit these docs! <https://github.com/OpenDroneMap/docs/blob/publish/source/multispectral.rst>`_