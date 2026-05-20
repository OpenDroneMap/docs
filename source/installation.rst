.. Notes and doc on installing ODM

Installation and Getting Started
================================

.. This section is excerpted and modified with permission from `OpenDroneMap: The Missing Guide <https://odmbook.com>`_, by Piero Toffanin.

Quickstart
----------

Installers for OpenDroneMap are available for purchase, and are the easiest way to get started and come with support.

https://opendronemap.org/download/

That said, OpenDroneMap is a free and open source ecoystem. Community support is available for those looking to install themselves and directions follow can be found here: `ODM Repo <https://github.com/OpenDroneMap/ODM>`_

Hardware Recommendations
------------------------

The bare minimum requirements for running the software
are:

* 64bit CPU manufactured on or after 2010
* 20 GB of disk space
* 4 GB RAM

No more than 100-200 images can be processed with the above specifications (the software will run out of memory). Recommended requirements are:

* Latest Generation CPU
* 100 GB of disk space
* 16 GB RAM

The above will allow the processing of a few hundred images with minimal issues. A CPU with more cores will allow for faster processing, while a graphics card (GPU) currently has no impact on performance. For processing more images, add more disk space and RAM linearly to the number of images you need to process.

.. csv-table:: Minimum RAM needed for N images
  :header: "Number of images", "RAM or RAM + Swap"

  "40","4"
  "250","16"
  "500","32"
  "1500","64"
  "2500","128"
  "3500","192"
  "5000","256"

