##########################
Frequently Asked Questions
##########################

***************
Data Processing
***************

Can I process two or more orthophoto GeoTIFFs to stitch them together? 
----------------------------------------------------------------------

No. ODM is a photogrammetric pipeline and orthophotos do not have the necessary camera information since the images have already been orthorectified. You can use another program such as `Hugin <http://hugin.sourceforge.net/>`_ to do that.

The software is not using all of my CPU cores / memory / GPU all of the times. Is it normal?
---------------------------------------------------------------------------

Yes. The software tries to use all available resources, when possible, but not always. It's normal to see 10-15% resource utilization at several moments during processing.

If I use the native version of the software, how can I allocate more resources for processing?
----------------------------------------------------------------------------------------------

No need; the native (non-docker) version of the software alredy uses all available resources.

*********
Licensing
*********

I want to build a commercial application that includes ODM. Do I need a commercial license?
-------------------------------------------------------------------------------------------

ODM is free and open source software, released under the `AGPLv3 <https://github.com/OpenDroneMap/ODM/blob/master/LICENSE>`_. You are free to build and sell applications with it, just make sure to comply with the requirements of the license, in particular the disclose source requirement.

Are there other licensing options aside from the AGPLv3?
--------------------------------------------------------

Nope, sorry!

*************
Memory issues
*************

Your computer is running out of memory, what can you do?
--------------------------------------------------------

1. First you can buy more RAM, this is the ultimate and final solution.
2. Alternatively you can resize the images when uploading and/or tweak your quality settings. 
3. Configure a swapfile. In both Windows and Linux you will need preferably a fast SSD or an NVME drive, and the computing process will be still a LOT slower.

  - If you are using Windows with `Docker+WSL2 <https://docs.docker.com/desktop/windows/wsl/>`_ you can add two rows in your .wslconfig file so that Docker will use a swapfile. See also the full Microsoft documentation on `Advanced settings configuration in WSL <https://docs.microsoft.com/en-us/windows/wsl/wsl-config>`_.
  
  .. code::
  
      "swap=128GB" # you will need 128GB of disk space of course
      "swapfile=C:\\temp\\wsl-swap.vhdx" # this is where the swap file will be stored

  - In Linux you can add a swap file or a partition dedicated to swap. For more information, please consult your search engine of choice as there are a lot of different distributions and methods to add swap.



`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/faq.rst>`_!
