| Parameter Type:
|  **String**
| Parameter Domain:
|  True: ``GeoJSON{}``
|  False: ``null``
| Parameter Default:
|  False: ``null``

----

========        ========
Resource        Impact
========        ========
CPU             ●●○ | Medium
GPU             ○○○ | None
HDD             ○○○ | None
RAM             ●○○ | Low
Time            ●●○ | Medium
========        ========

----

What is Boundary [GeoJSON]?
----------------------------
The ``--boundary`` argument serves to constrain and "crop" all final output products of a processing task to the bounding box created by the GeoJSON string that is passed to the ``--boundary`` argument.

When is Boundary [GeoJSON] appropriate?
----------------------------------------
Passing a ``--boundary`` GeoJSON is appropriate in any instance where one would want a specific subset of the entire reconstruction area.

If you are interested in the complete reconstruction, the ``--auto-boundary`` option would likely be more appropriate.

Further, given that the ``--boundary`` is applied after the products are generated (and thereby modifying them), it adds processing time to the dataset, and may not be appropriate if one's primary concern is generating a complete product as fast as possible.

Why would one use Boundary [GeoJSON]?
--------------------------------------
One might want to use the ``--boundary`` function to limit the final products to a predefined Area Of Interest (AOI).

As an example, you are tasked to survey a given property/lot. You decide to include 20m of overfly in your survey so that the reconstruction is clean and with sufficient overlap right up to the property boundaries. However, due to this overfly and your flight height you also capture and reconstruct bordering properties and homes that are not part of your survey AOI. Using a GeoJSON representation of the AOI property's boundary, you would then "clip" all of the final products to be just what is inside the GeoJSON boundary, providing you with a clean, focused, and "safe" representation of the survey AOI (and nothing beyond it).

How would one create Boundary [GeoJSON]?
-----------------------------------------


Example Images
---------------

True: ``--boundary [GeoJSON]`` - Point Cloud
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/140858936-10fda65f-c278-46ae-95bd-7af8f8369554.png
  :alt: WebODM displaying the "clipped" reconstruction of the Brighton Beach dataset Point Cloud.

  The WebODM 3D View shows the modified extent of the reconstruction Point Cloud, bounded by the GeoJSON proivded to the ``--boundary`` option.

True: ``--boundary [GeoJSON]`` - Orthophoto
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/140859033-c6cab4f0-74b3-4266-b5ec-4a90da931340.png
  :alt: WebODM displaying the "clipped" reconstruction of the Brighton Beach dataset Orthophoto.

  The WebODM 3D View shows the modified extent of the reconstruction Orthophoto, bounded by the GeoJSON proivded to the ``--boundary`` option.

True: ``--boundary [GeoJSON]`` - Digital Elevation Model
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/140859073-28db5174-9a40-42d8-86d6-f345d9dad5a8.png
  :alt: WebODM displaying the "clipped" reconstruction of the Brighton Beach dataset Digital Elevation Model.

  The WebODM 3D View shows the modified extent of the reconstruction Digital Elevation Model, bounded by the GeoJSON proivded to the ``--boundary`` option.

True: ``--boundary [GeoJSON]`` - 3D Model/Textured Mesh
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/140859125-4854e651-9eff-430d-956c-16f4d9a52dfd.png
  :alt: WebODM displaying the "clipped" reconstruction of the Brighton Beach dataset 3D Model/Textured Mesh.

  The WebODM 3D View shows the modified extent of the reconstruction 3D Model/Textured Mesh, bounded by the GeoJSON proivded to the ``--boundary`` option.

False: ``null``
^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/140858712-9bfd8c56-a52a-480e-b68d-d5a97bc516fd.png
  :alt: WebODM displaying the full reconstruction of the Brighton Beach dataset Point Cloud.

  The WebODM 3D View shows the full extent of the recosntruction. Compared to the ``--boundary`` reconstruction above, one can see that the full reconstruction area is much larger and includes many features outside of the Area Of Interest used to generate the GeoJSON.

