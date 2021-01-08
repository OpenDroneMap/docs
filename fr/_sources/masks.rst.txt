#################
Using Image Masks
#################

Starting from ODM ``2.0`` people can supply image masks to inform the software to skip reconstruction over certain areas. This is useful for cases where the sky was accidentally included in the input photos from oblique shots, or simply to limit the reconstruction of a single subject.

To add a mask, simply create a new black and white image of the same dimension as the target image you want to mask (you can use a program such as GIMP to do this). Color in black the areas to exclude from the reconstruction. 

.. figure:: https://user-images.githubusercontent.com/1951843/93247037-ade87a00-f75b-11ea-8b42-25bc1d89279d.png
   :alt: Target image
   :align: center

.. figure:: https://user-images.githubusercontent.com/1951843/93247007-a2954e80-f75b-11ea-87b3-4f04bd1737b9.png
   :alt: Image mask
   :align: center


.. figure:: https://user-images.githubusercontent.com/1951843/93246970-8f827e80-f75b-11ea-8179-5a8fdd9f5193.png
   :alt: 3D result (building is masked)
   :align: center

Name your file:

``<filename>_mask.JPG``

For example, ``DJI_0018.JPG`` can have a mask by creating a ``DJI_0018_mask.JPG`` file and include that in the list of images. You can use ``.JPG``, ``.PNG``, ``.BMP`` and ``.TIF`` formats for image masks.


`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/masks.rst>`_!
