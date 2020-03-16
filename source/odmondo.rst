Using ODM from low-bandwidth location
=====================================

What is this and who is it for?
-------------------------------

`OpenDroneMap <https://www.opendronemap.org/>`__ can’t always be
effectively set up locally—it takes a fairly powerful machine to process
large datasets—so a cloud machine can sometimes be the answer for people
in the field. However, bandwidth is a problem in many low-income
settings. This constraint can’t be solved completely, but the following
method does a reasonable job of reducing the bandwidth needed to process
drone imagery datasets on the cloud from African locations.

Here we present a tricky but workable process to create an OpenDroneMap
cloud machine (*not* CloudODM, mind you, just a cloud-based instance of
ODM that you run from the command line) and use it to remotely process
large photo sets. It requires familiarity with Unix command line use,
ssh, a Digital Ocean account (Amazon AWS would work as well, possibly
with slight differences in the setup), and a moderate level of general
computer literacy. If you aren’t fairly computer-savvy and willing to
fuss with a slightly tricky setup,
`CloudODM <https://www.opendronemap.org/cloudodm/>`__ is what you should
be looking at.

The whole process is mostly targeted at someone flying substantial
missions in an African or similar location looking to process data ASAP
while still in a field setting. Therefore it emphasizes a workflow
intended to reduce bandwidth/data transfer, rather than just the
simplest way of running ODM.

Steps
=====

Install
-------

-  Create a Digital Ocean droplet with at least 4GB of RAM. That’ll cost
   about $20/month. Less than 4GB of RAM and the install will probably
   fail. When we actually run the ODM process we’ll resize it to a much
   larger—and more expensive—cloud machine, but between runs you can
   downsize it between runs to the second-cheapest droplet which costs
   only $10/month (the cheapest droplet, at $5/month, comes with such a
   small drive that you can’t downsize back to it).

   -  Should be an Ubuntu 16.04 instance to ensure dependency
      compatibility
   -  Create a user with sudo privileges. `Digital Ocean’s insanely good
      documentation <https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04>`__
      can help you figure this out. In our case we set up a user called
      ``odm``, so connecting to it is via the command
      ``ssh odm@xxx.xxx.xxx.xxx`` (where the x’s stand for the IPv4
      address of your server). If you want to follow this example
      closely, *do* use the username ``odm``; then your install path
      will be ``/home/odm/ODM/`` and will match all of the examples in
      this document. -When you log into the server, it will offer you
      the option to upgrade to Ubuntu 18.04, a more recent version.
      Don’t. ODM native install doesn’t work smoothly on 18.04. Go ahead
      and execute ``sudo apt update`` and ``sudo apt upgrade`` to ensure
      your server isn’t dangerously without updates, but stay with
      Ubuntu 16.04.

-  Download and install ODM on it from the `ODM
   Github <https://github.com/OpenDroneMap/ODM>`__ (regular, not WebODM)
   with the following commands:

::

   git pull https://github.com/OpenDroneMap/ODM.git
   cd ODM
   bash configure.sh install

-  If you do this from the default home folder of your user
   (i.e. ``odm``) the path to the install will be ``/home/odm/ODM``
   (abbreviated as ``~/ODM/``).
-  There are some environmental variables that need to be set. Open the
   ~/.bashrc file on your machine and add the following 3 lines at the
   end (From `the ODM github <https://github.com/OpenDroneMap/ODM>`__).
   The file can be opened with ``nano ~/.bashrc`` (or whatever text
   editor you use in lieu of nano). Be sure to replace ``/home/odm/``
   with the correct path to the location where you extracted
   OpenDroneMap if you didn’t do everything exactly as in our example
   (for example if you used a different username in your server setup):

::

   export PYTHONPATH=$PYTHONPATH:/home/odm/ODM/SuperBuild/install/lib/python2.7/dist-packages
   export PYTHONPATH=$PYTHONPATH:/home/odm/ODM/SuperBuild/src/opensfm
   export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/odm/ODM/SuperBuild/install/lib

-  Note that the ODM github readme contains a slight error, the install
   directory name will be ODM, not OpenDroneMap (you’ll see this if you
   compare the above instructions to the ones on the ODM GitHub).

-  In order to prevent a crash wherein the split-merge process fails to
   locate its own executable, we add the following lines to
   ``~/.bashrc`` (adjust paths if you’ve set things up differently from
   our example):

::

   export PYTHONPATH=$PYTHONPATH:/home/odm/ODM/
   export PATH=$PATH:/home/odm/ODM/

-  Now you’ll need a second cloud hard drive (a “Volume” in Digital
   Ocean jargon) big enough to manage your project. Rule of thumb seems
   to be 10 times the size of your raw image set; we’ve got a 100GB
   image set and set up a 1000GB volume (once the run is done you should
   be able to get rid of most of this expensive drive capacity, but it’s
   needed to complete the process). Set up the volume, attach it to your
   droplet, and `configure its mount
   point <https://www.digitalocean.com/docs/volumes/how-to/mount/>`__
   (in this example we’re setting it to ``/mnt/odmdata/``).

Prep data and project
---------------------

-  Now push your images onto the server. You can use `Secure Copy
   (scp) <https://en.wikipedia.org/wiki/Secure_copy>`__ like so:
   ``scp -r /path/to/my/imagefolder odm@xxx.xxx.xxx.xxx:/mnt/odmdata/``.

   -  This pushes the entire folder full of images (that’s what the
      ``-r`` option does, “recursive”) into the remote location (in our
      example, into the volume we attached to the cloud machine at
      ``/mnt/odmdata/``.
   -  This will take some bandwidth. No way around the size of the
      files.\ `1 <#footnote1>`__, \ `2 <#footnote2>`__\ 

Directory structure
~~~~~~~~~~~~~~~~~~~

ODM requires the directories on the machine to be set up just so. The
critical bits are the install folder (if you installed as above, it’s
``/home/odm/ODM/``) and the project folder
(i.e. ``/mnt/odmdata/myproject/``)

-  ODM’s settings.yaml file specifies a single parent directory
   containing all projects. This is what goes in the project path line
   of the settings.yaml file (slightly confusingly, this is actually the
   *parent* directory of the individual project directories, which are
   specified by the project name parameter when calling ODM). Edit
   settings.yaml and set the project_path parameter to (as per our
   example setup) ``/mnt/odmdata/``, which in this case points to the
   Volume we created. Individual project directories are created within
   that.
-  Individual project directories, i.e. ``/mnt/odmdata/myproject/``
   contain the gcp_list.txt file, the image_groups.txt file, and the
   images folder for each project``\`
-  The images folder, i.e. ``/mnt/odmdata/myproject/images/`` contains
   all of the images. If you set it up like this, the images don’t get
   re-copied because they’re already in the directory that ODM wants
   them in.
-  If you’ve got images with GPS info on them (as from an Ebee), use
   exiftool to massage the GPS information
   ``exiftool "-GPSDOP<GPSZAccuracy" .``.\ `3 <#footnote3>`__\  To do so
   you’ll need to install exiftool. The command for that is probably
   ``sudo apt install libimage-exiftool-perl``.
-  Modify settings.yaml to specify the parent directory of the project
   folder (in this case the Volume we created, ``/mnt/odmdata/``). Make
   sure the images are in the correct spot,
   i.e. ``/mnt/odmdata/myproject/images`` and the other ancillary files
   (gcp_list.txt and image_groups.txt) are in the root folder
   ``/mnt/odmdata/myproject/``
-  if you have the images in separate folders for individual AOI blocks
   or flights (which you will if your flight management was organized),
   you can create an image_groups.txt file with the incantations
   ``for i in *; do cd $i; for j in *; do echo "$j $i" >> ../$i.txt; done; cd ../; done;``
   and ``cd ../``,
   ``for i in myproject/*.txt; do cat $i >> image_groups.txt; done;``.
   That should create a file with the correct structure: a list of all
   image files and a “group name” after each one (which in this case
   will simply be the name of the folder it came from). Then move all of
   the image files into a single directory called images in the project
   root dir (so ``/mnt/odmdata/myproject/images/``). The
   image_groups.txt file will allow ODM to keep track of which images
   belong to the same batch, even though they’re all in a single
   directory.

TODO explain the structure of image_groups.txt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TODO explain the structure of the gcp_list.txt file, and maybe explain the process Iddy and I used to create it.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Resize droplet, pull pin, run away
----------------------------------

-  Shut down and resize your machine to an appropriately monstrous
   number of CPUs and amount of memory. I use the memory-optimized
   machine with 24 dedicated vCPUs and 192GB of RAM (which costs about
   $1.60/hr—which adds up fast, it’s over $1000/month). Restart, and get
   to work quickly so as not to waste expensive big-droplet time.
-  Launch the ODM process via ssh using nohup (so that if you’re cut
   off, processing will continue)

   -  Alternately you can use GNU screen to launch the process from a
      screen session which won’t stop if your connection is interrupted;
      launch ``screen``, and use ``<ctrl> a <ctrl> d`` to detach,
      ``screen -r`` to re-attach. But using screen won’t get you a log
      file of all of the console output unless you do something specific
      to capture that, while nohup gives you a file with all of the
      console output, including error messages, for free.
   -  Note: as of 2020-03 the normal incantation
      ``python run.py -i /path/to/image/folder project_name`` seems
      *not* to work; the ``-i`` or ``--image`` parameter causes a weird
      error. So we drop the -i parameter, and rely on the project
      directory line in the settings.yaml file to direct ODM to the
      right place. Now using (including a split-merge):

::

   nohup python run.py myproject --split 1 --split-overlap 0 --ignore-gsd --depthmap-resolution 1000 --orthophoto-resolution 5 --dem-resolution 15 --pc-las --dsm

-  This points ODM at the folder (in this example)
   ``/mnt/odmdata/myproject/``. Provided the image_groups.txt and
   gcp_list.txt are in this folder, the images are in
   ``/mnt/odmdata/myproject/images/``, and the project path in
   settings.yaml is ``/mnt/odmdata/`` it will not waste time and space
   copying images.

-  Note that this assumes you have an image_groups.txt file. If not,
   this ``-split-overlap 0`` will probably fuck things up, and the
   ``--split 1`` is literally a random number that will be ignored after
   the image_groups.txt file is loaded (I think it normally controls how
   many groups it splits a set of images into, but in our case we’re
   assuming the images are already grouped sensibly). If you don’t have
   a large dataset (>1000 images), omit the ``--split`` and
   ``--split-overlap`` options.

-  Follow the progress using tail (so that you’ll know when it’s done)

::

   tail -f nohup.out

-  You may want to keep an eye on htop (to get a sense of the resource
   usage so that in future you can only spin up a machine as large as
   necessary)

After it finishes (assuming you survive that long)
--------------------------------------------------

-  As soon as processing is done, shut down the machine and resize it
   back down to the inexpensive minimum capacity.
-  Start the machine back up, and log in via ssh.
-  If you want to save download bandwidth, you can compress the
   orthophoto using GDAL. Don’t add overviews, do that on your local
   machine to avoid making the file bigger before downloading it.

::

   gdal_translate -co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR -co TILED=YES -b 1 -b 2 -b 3 -mask 4 --config GDAL_TIFF_INTERNAL_MASK YES /path/to/original/filename.extension /path/to/output.tif

-  Download using scp:
   ``scp odm@xxx.xxx.xxx.xxx:/mnt/odmdata/myproject/odm_orthophoto/odm_orthophoto.tif``
   (or grab the compressed version you created in the last step)

-  Once you get the file on your local computer, you can use QGIS to add
   overviews (“pyramids”) or use the GDAL command
   ``gdaladdo -r average /path/to/image.tif 2 4 8 16 32 64 128 256 512 1024``.

-  You can archive the odm_texturing, odm_georeferencing, and odm-dem
   folders using tar to make them easier to download in one piece (and
   maybe smaller).

::

   tar -zcvf archivename /path/to/folder

TODO
====

-  Remove complaints about bugs from this doc, and file bug reports to
   ODM (also maybe fix the easy ones)
-  Set up an api-driven workflow that creates, upsizes, runs, and then
   downsizes or destroys the big expensive droplet.

   -  The trick is probably monitoring for errors and/or completion.

-  *Or*\ … get this workflow sorted with WebODM, which maybe does the
   same thing?

Footnotes
=========

1: Ok, that’s not quite true (that there’s no way around the file size).
There are ways to further reduce the size of the data that needs to be
transmitted, but they are tricky and probably not worth it unless you’re
in extremely constrained circumstances. Compressing the images further
risks degrading the data quality, and possibly reducing the
effectiveness of the ODM point matching. However, if you compress the
images into JPEG with `YCbCr <https://en.wikipedia.org/wiki/YCbCr>`__
colorspace instead of RGB (I’m not gonna tell you how to do this; if you
don’t know you shouldn’t try), this retains essentially all of the
feature detail in the luminance channel (Y) and agressively compresses
the chrominance channels (Cb and Cr) which shouldn’t really affect the
quality of the ODM output (ODM only uses a single band to generate the
point cloud anyway; in fact it’s possible that it will increase the
quality of the point cloud matching because the luminance channel will
probably have more feature contrast than any of the RGB channels) and
will get you a substantial reduction in file size. But honestly, you
only want to mess with this if you know what you are doing and are
absolutly desperate to save bandwidth; it adds a lot of extra work and
local processing time.

2: There are also some ways to speed up data transfer, albeit with some
risk. For example, you can use
`Netcat <https://en.wikipedia.org/wiki/Netcat>`__ to send data instead
of SCP. Netcat is totally unencrypted (insecure), but can usually send
at the highest data rate supported by your connection. If you are
feeling extra bold, you can send with Netcat using UDP instead of TCP,
which is very likely to introduce data corruption but goes *really*
fast. This is another thing that I won’t tell you how to do; if you
don’t already know you shouldn’t try (and even if you do know how you
probably shouldn’t)!

2: This takes the Z error estimate that the ebee sets and copies that
tag to the DOP tag, where OpenDroneMap will read it and use it to
constrain the SfM modeling process (i.e. : optimize this model, but
don’t move the cameras further than the dilution off precision estimate,
instead modify other aspects of camera pose and lens parameters).
