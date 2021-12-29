| Parameter Type:
|  **Boolean**
| Parameter Domain:
|  True: ``--auto-boundary``
|  False: ``null``
| Parameter Default:
|  False: ``null``

----

========        ========
Resource        Impact
========        ========
CPU             ●○○ | Low
GPU             ○○○ | None
HDD             ○○○ | None
RAM             ●○○ | Low
Time            ●○○ | Low
========        ========

----

What Is Auto-Boundary?
----------------------
``--auto-boundary`` is a process that seeks to limit the boundaries of the reconstruction based upon a K-Means filtered Convex Hull buffered by 20x the mean GSD of the dataset.

When Is Auto-Boundary Helpful?
------------------------------
``--auto-boundary`` is appropriate to use on any dataset where one might possibly consider limiting the area of reconstruction due to the presence of sky or far-away background that they would not normally consider part of the desired reconstruction.

``--auto-boundary`` does not have a meaningful impact on nadir (or near-nadir) imagery without sky/background, making it superflous, but safe, to include.

In other words, if you would consider masking the image, ``--auto-boundary`` is likely a good choice.

Why would one use auto-boundary?
--------------------------------
Auto-Boundary is most helpful in preventing the reconstruction area from growing needlessly large when things like sky, clouds, or far-away features like treelines get included in the reconstruction.

By preventing the boundaries of the reconstruction from growing needlessly large, Out-Of-Memory errors become far less likely, and one will likely see a decrease in processing time due to the smaller area being reconstructed.

Example Images
--------------

True: ``--auto-boundary``
^^^^^^^^^^^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/140864618-2a0c95f2-669e-45dc-b5c5-df82a555e4e5.png
  :alt: WebODM displaying the reconstruction extent of a terrestrial orbit survey of a Northern Catalpa tree.

  The WebODM 3D View shows the full extent of the reconstruction, bounded by the ``--auto-boundary`` option.

False: ``null``
^^^^^^^^^^^^^^^
.. figure:: https://user-images.githubusercontent.com/19295950/140864753-db3695c5-3ba2-48fb-a644-3e591913de72.png
  :alt: WebODM displaying the reconstruction extent of a terrestrial orbit survey of a Northern Catalpa tree.

  The WebODM 3D View shows the full extent of the recosntruction. Compared to the ``--auto-boundary`` reconstruction above, one can see that the full reconstruction area is much larger (and therefore more visually sparse).
