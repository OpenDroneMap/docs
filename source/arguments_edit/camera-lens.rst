| Parameter Type:
|  **String**
| Parameter Domain:
|  ``auto`` : Automatic selection of best camera projection model.
|  ``brown`` : Robust rectilinear projection model. Preferred by ``auto``.
|  ``fisheye`` : Wide-angle / non-rectilinear projection model.
|  ``perspective`` : Legacy rectilinear projection model.
|  ``spherical`` : 360° camera projection model.
| Parameter Default:
|  ``auto``

----

========        ========
Resource        Impact
========        ========
CPU             ●○○ | Low
GPU             ○○○ | None
HDD             ●○○ | Low
RAM             ●○○ | Low
Time            ●○○ | Low
========        ========

----

What Are Camera Lens Models?
----------------------------
Camera Lens Models are projection/distortion models that OpenSFM uses to correct for the optics of the camera platforms that record our images. These corrections are essential for proper camera/scene modeling, and therefore, proper reconstruction of the data.

When are manual selections appropriate?
---------------------------------------
Manually choosing a Camera Lens Model is currently only recommended in the case of Spherical Cameras (GoPro Fusion, GoPro Max, Insta360, Kodak PixPro, etc.) as these are currently not detected automatically by OpenSFM.

Why would one use a particular Camera Lens Model?
-------------------------------------------------
In rare cases, OpenSFM may not be able to detect (or retrieve from its Camera database) the correct Camera Lens Model for your particular sensor, in which case you should select the closest appropriate model. When in doubt, try specifying ``brown`` first.

Example Images
--------------

The following examples are all data taken with a standard Rectilinear Lens. Manual selection of the various Camera Lens Models is demonstrated to show some differences in how this will affect reconstruction.

``auto`` : Rectilinear Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/127077336-ae79a958-a953-4376-86fd-430d0e5457f2.png
  :alt: Rectilinear data rendered by ``auto`` Camera Lens Model

  This Point Cloud shows a proper reconstruction via the ``auto`` (``brown``) Camera Lens Model, which is appropriate for this sensor.

``brown`` : Rectilinear Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/127077753-580a174e-7572-4315-8801-224ce097d9fc.png
  :alt: Rectilinear data rendered by ``brown`` Camera Lens Model

  As in the prior example, this Point Cloud is reconstructed via the ``brown`` Camera Lens Model.

``fisheye`` : Rectilinear Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/127077826-53d459fe-5e4e-4b10-8e70-fbddf775c4f7.png
  :alt: Rectilinear data rendered by ``fisheye`` Camera Lens Model

  In this Point Cloud reconstruction, severe bowling and other artifacts have been introduced via the use of the wrong Camera Lens Model.

``perspective`` : Rectilinear Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: https://user-images.githubusercontent.com/19295950/127077485-699f9e61-72a6-45f2-990f-f5748b6ee99f.png
  :alt: Rectilinear data rendered by ``perspective`` Camera Lens Model

  This Point Cloud rendered well, very similar to the ``auto`` and ``brown`` examples. One may see artifacts in the ``perspective`` Camera Lens Model in very large collections, or over very flat/homogenus terrain (agricultural fields). In such cases, forcing ``brown`` may help.

``spherical`` : Rectilinear Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: https://user-images.githubusercontent.com/19295950/127078960-27e35cbb-a378-4d0d-92e2-42dbfd1edd7c.png
  :alt: Rectilinear data rendered by ``spherical`` Camera Lens Model

  This Point Cloud failed to reconstruct properly due to the manual selection of the ``fisheye`` Camera Lens Model. Similar failures to reconstruct can often indicate the wrong manual selection, or in edge cases, wrong ``auto`` selection of the Camera Lens Model, and you are advised to try another Model that is more appropriate.
