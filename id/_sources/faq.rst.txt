###################################################
Frequently Asked Questions and Additional Resources
###################################################

**************************
Frequently Asked Questions
**************************

Data Processing
---------------

**Can I process two or more orthophoto GeoTIFFs to stitch them together?**

No. ODM is a photogrammetric pipeline and orthophotos do not have the necessary camera information since the images have already been orthorectified. You can use another program such as `Hugin <http://hugin.sourceforge.net/>`_ to do that.

**The software is not using all of my CPU cores / memory / GPU all of the times. Is it normal?**

Yes. The software tries to use all available resources, when possible, but not always. It's normal to see 10-15% CPU utilization at several moments during processing and 0% GPU utilization for lots of times.

**If I use the native version of the software, how can I allocate more resources for processing?**

No need; the native (non-docker) version of the software already uses all available resources.

Licensing
---------

**I want to build a commercial application that includes ODM. Do I need a commercial license?**

ODM is free and open source software, released under the `AGPLv3 <https://github.com/OpenDroneMap/ODM/blob/master/LICENSE>`_. You are free to build and sell applications with it, just make sure to comply with the requirements of the license, in particular the disclose source requirement.

**Are there other licensing options aside from the AGPLv3?**

Nope, sorry!

Memory issues
-------------

**Your computer is running out of memory, what can you do?**

1. First you can buy more RAM, this is the ultimate and final solution.
2. Alternatively you can resize the images when uploading and/or tweak your quality settings.
3. Configure a swapfile. In both Windows and Linux you will need preferably a fast SSD or an NVME drive, and the computing process will be still a LOT slower.

  - If you are using Windows with `Docker+WSL2 <https://docs.docker.com/desktop/windows/wsl/>`_ you can add two rows in your .wslconfig file so that Docker will use a swapfile. See also the full Microsoft documentation on `Advanced settings configuration in WSL <https://docs.microsoft.com/en-us/windows/wsl/wsl-config>`_.

  .. code::

      "swap=128GB" # you will need 128GB of disk space of course
      "swapfile=C:\\temp\\wsl-swap.vhdx" # this is where the swap file will be stored

  - In Linux you can add a swap file or a partition dedicated to swap. For more information, please consult your search engine of choice as there are a lot of different distributions and methods to add swap.

*********************
Additional References
*********************

For Users
---------

The following resources are a good place to start:

* `README page for ODM <https://github.com/OpenDroneMap/OpenDroneMap>`_
* `README page for WebODM <https://github.com/OpenDroneMap/WebODM>`_
* `README page for NodeODM <https://github.com/OpenDroneMap/node-OpenDroneMap>`_
* `Ground Control Points Format Specification <https://github.com/mapillary/OpenSfM/blob/master/doc/source/gcp.rst>`_
* `OpenDroneMap: The Missing Guide <https://odmbook.com/>`_

For Developers
--------------

In addition to user resources, we recommend to also read the following:

* WebODM documentation: https://docs.webodm.org
* NodeODM API specification: https://github.com/OpenDroneMap/NodeODM/blob/master/docs/index.adoc
* Overview of the ODM pipeline: http://community.opendronemap.org/t/where-can-i-find-background-information-on-the-concepts-of-odm/665/2
* We keep a `section in our forum dedicated to research papers <http://community.opendronemap.org/c/ideas-proposals/research-papers>`_. This is a valuable place where to read more about state of the art research related to structure from motion, multi-view stereo, meshing, texturing, etc. which can be used to improve the software.

`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/faq.rst>`_!
