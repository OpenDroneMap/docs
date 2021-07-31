| Parameter Type:
|  **Boolean**
| Parameter Domain:
|  True: ``--build-overviews``
|  False: ``null``

----

========        ========
Resource        Impact
========        ========
CPU             ░▓░
GPU             ░░░
HDD             ░▓░
RAM             ░▓░
Time            ░▓░
========        ========

----

What Are Overviews?
-------------------
Overviews (sometimes referred to as pyramids) are an optimization that reduce the time it takes to render GeoTIFF files; Larger file-size is the tradeoff for this increased rendering performance.

Overviews are lower-resoultion copies of the raster data (Power of two factor [128x128, 256x256, etc]) that are stored either internally or externally in a sidecar.

In the case of OpenDroneMap, the Overviews will always be internal.

When are Overviews appropriate?
-------------------------------
One would likely want to use Overviews for nearly every instance, with some few (relatively rare) exceptions.

 * Small File Size is paramount
 * Reading software does not support internal Overviews

Why would one use Overviews?
----------------------------
Overviews speed preview of the raster data by allowing the program rendering the raster to choose the closest size pyramid to match the resolution of the display extent that it is being rendered into, potentially saving a significant amount of time retrieving the full-size raster, buffering it, and then downscaling it for display.

In the case of WebODM, Overviews are used to create dynamic tiles for rapid display and navigation of the 2D web map.

Example Images
--------------

True: ``--build-overviews``
^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/127073339-6b2a0a4f-6ede-4dc1-8da4-5bc9646de304.png
  :alt: QGIS displaying the generated Overviews

  The Layer Properties panel demonstrates that this OpenDroneMap-generated GeoTIFF has internal Overviews.

False: ``null``
^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/127074349-a3f84c4c-d05c-4bf1-bd7c-790781ad0fe3.png
  :alt: QGIS displaying the file is lacking Overviews

  The Layer Properties panel demonstrates that this OpenDroneMap-generated GeoTIFF lacks internal Overviews.
