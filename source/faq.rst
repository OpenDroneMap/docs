##########################
Frequently Asked Questions
##########################

***************
Data Processing
***************

Can I process two or more orthophoto GeoTIFFs to stitch them together? 
----------------------------------------------------------------------

No. ODM is a photogrammetric pipeline and orthophotos do not have the necessary camera information since the images have already been orthorectified. You can use another program such as `Hugin <http://hugin.sourceforge.net/>`_ to do that.

*********
Licensing
*********

I want to build a commercial application that includes ODM. Do I need a commercial license?
-------------------------------------------------------------------------------------------

ODM is free and open source software, released under the `AGPLv3 <https://github.com/OpenDroneMap/ODM/blob/master/LICENSE>`_. You are free to build and sell applications with it, just make sure to comply with the requirements of the license, in particular the disclose source requirement.

Are there other licensing options aside from the AGPLv3?
--------------------------------------------------------

Nope, sorry!


`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/faq.rst>`_!

*********
Memory issues
*********
Your computer is running out of memory, what can I do?
-------------------------------------------------------------------------------------------
1. First you can buy more RAM, this is the ultimate and final solution.
2. Alternatively you can resize the images when uploading.
3. If using Windows and Docker, you can add a row in your .wslconfig file so that Docker will use a swapfile: 
  "swap=128GB"
  "swapfile=C:\\temp\\wsl-swap.vhdx"
  
4. In Linux you can do the same, add a swap file or a partition.
In Both cases you will need preferably a fast SSD or an NVME drive, but it will be still slow.
