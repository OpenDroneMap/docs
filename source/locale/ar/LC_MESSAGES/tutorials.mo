��    `                      �     A   �     �  2     �  K  �   	  q   �	  %  B
  ;   h  �   �     Y  �  p  �       �      �  �  �  ,  �  !   �  !     �   >     �  �     �   �  �   .  "   �  G   �  �   @  X     �   i  l    ]   x  �   �  �   m  �   -  �          �   b   �      !  M  )!  �   w"  �  B#  V  1%  �   �&  G   K'  B  �'  �   �)    �*  �   �,  J   �-     �-  �   �-  "   �.  �  �.  E   Y0  L  �0  �  �1    �3  .   �4     �4  �   �4  S   �5  +  �5    7  �   39  1  :  �   3;  n   	<  �   x<  �   =  	   �=  5   �=      >  %   ->  h   S>  q   �>  H   .?  R   w?  c   �?     .@  �   N@  �   A  �   �A  �  *B  �   D  R   �D  �   OE  �   *F  �   �F  d   VG  �   �G  �   �H  �   I  B   �I  �   J  L  �J    N  0  )P  d   ZQ  ?   �Q  E   �Q  �  ER  B  �T  �   V  �  �V  Y   �X  �   Y     �Y  .  Z  #  B^     f`  6   �`  "  �`  ,  �c  9   
f  .   Df    sf     �g  �  �g  �   5j  �   �j  ,   �k  X    l  1  Yl  X   �m  �   �m  �  �n  �   	r  �   �r    �s  <  �t  �   �u  
   �v  �   �v      Aw  �  bw  F  y  �  [z  �  6}  �   !  �   �  �  ��  %  >�    d�  .  ��  e   ��  ,   �    F�  E   H�  w  ��  O   �  Y  V�  Z  ��  �  �  a   ��  
   ��    �  �   %�  �  ��  �  ��  \  f�  �  Ü  (  ]�  �   ��  �   )�  |  �     ��  U   ��     �  K   �  �   O�  �   ��  K   ��  {   �  �   �     -�  0  G�  �   x�  �   6�  6  ��  u  6�  Y   ��  o  �  �   v�  �   N�  �   �  )  ��  �   ��    ��  c   ��  �   ��  x  �   *Bowling effect on point cloud over 13,000+ image dataset collected by World Bank Tanzania over the flood prone Msimbasi Basin, Dar es Salaam, Tanzania.* A few simple commands can make our docker experience much better. Accessing logs on the instance After it finishes (assuming you survive that long) Alternately you can use GNU screen to launch the process from a screen session which won’t stop if your connection is interrupted; launch ``screen``, and use ``<ctrl> a <ctrl> d`` to detach, ``screen -r`` to re-attach. But using screen won’t get you a log file of all of the console output unless you do something specific to capture that, while nohup gives you a file with all of the console output, including error messages, for free. Alternatively, the following experimental method can be applied: fly with much lower overlap, but two *crossgrid* flights (sometimes called crosshatch) separated by 20° with a 5° forward facing camera. As soon as processing is done, shut down the machine and resize it back down to the inexpensive minimum capacity. As this approach to flying can be take longer than typical flights, a pilot or team can fly a small area using the above approach. OpenDroneMap will generate a calibration file called cameras.json that then can be imported to be used to calibrate another flight that is more efficiently flown. Below you will find instructions for some common use cases. By default ODM does not create DEMs. To create a digital terrain model, make sure to pass the ``--dtm`` flag. To create a digital surface model, be sure to pass the ``--dsm`` flag. Calibrating the Camera Camera calibration is a special challenge with commodity cameras. Temperature changes, vibrations, focus, and other factors can affect the derived parameters with substantial effects on resulting data. Automatic or self calibration is possible and desirable with drone flights, but depending on the flight pattern, automatic calibration may not remove all distortion from the resulting products. James and Robson (2014) in their paper `Mitigating systematic error in topographic models derived from UAV and ground‐based image networks <https://onlinelibrary.wiley.com/doi/full/10.1002/esp.3609>`_ address how to minimize the distortion from self-calibration. Changing these options can affect the result of DTMs significantly. The best source to read to understand how the parameters affect the output is to read the original paper `An improved simple morphological filter for the terrain classification of airborne LIDAR data <https://www.researchgate.net/publication/258333806_An_Improved_Simple_Morphological_Filter_for_the_Terrain_Classification_of_Airborne_LIDAR_Data>`_ (PDF freely available). Cleaning up after Docker Command line access to instances Create a Digital Ocean droplet with at least 4GB of RAM. That’ll cost about $20/month. Less than 4GB of RAM and the install will probably fail. When we actually run the ODM process we’ll resize it to a much larger—and more expensive—cloud machine, but between runs you can downsize it between runs to the second-cheapest droplet which costs only $10/month (the cheapest droplet, at $5/month, comes with such a small drive that you can’t downsize back to it). Create a user with sudo privileges. `Digital Ocean’s insanely good documentation <https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04>`__ can help you figure this out. In our case we set up a user called ``odm``, so connecting to it is via the command ``ssh odm@xxx.xxx.xxx.xxx`` (where the x’s stand for the IPv4 address of your server). If you want to follow this example closely, *do* use the username ``odm``; then your install path will be ``/home/odm/ODM/`` and will match all of the examples in this document. Creating Digital Elevation Models Creating High Quality Orthophotos Crossgrid overlap percentages can be lower than parallel flights. To get good 3D results, you will require 68% overlap and sidelap for an equivalent 83% overlap and sidelap. Directory structure Docker has a lamentable use of space and by default does not clean up excess data and machines when processes are complete. This can be advantageous if we need to access a process that has since terminated, but carries the burden of using increasing amounts of storage over time. Maciej Łebkowski has an `excellent overview of how to manage excess disk usage in docker <https://lebkowski.name/docker-volumes/>`_. Download and install ODM on it from the `ODM Github <https://github.com/OpenDroneMap/ODM>`__ (regular, not WebODM) with the following commands: Download using scp: ``scp odm@xxx.xxx.xxx.xxx:/mnt/odmdata/myproject/odm_orthophoto/odm_orthophoto.tif`` (or grab the compressed version you created in the last step) Example of how to generate a DTM:: Follow the progress using tail (so that you’ll know when it’s done) For DTM generation, a Simple Morphological Filter (smrf) is used to classify points in ground vs. non-ground and only the ground points are used. The ``smrf`` filter can be controlled via several parameters: From James and Robson (2014), `CC BY 4.0 <https://creativecommons.org/licenses/by/4.0>`_ Go ahead and execute ``sudo apt update`` and ``sudo apt upgrade`` to ensure your server isn’t dangerously without updates. Make sure to stay with Ubuntu 18.04. Here we present a tricky but workable process to create an OpenDroneMap cloud machine (*not* CloudODM, mind you, just a cloud-based instance of ODM that you run from the command line) and use it to remotely process large photo sets. It requires familiarity with Unix command line use, ssh, a Digital Ocean account (Amazon AWS would work as well, possibly with slight differences in the setup), and a moderate level of general computer literacy. If you aren’t fairly computer-savvy and willing to fuss with a slightly tricky setup, `CloudODM <https://www.opendronemap.org/cloudodm/>`__ is what you should be looking at. If we want to see machines that may not be running but still exist, we can add the `-a` flag: If you do this from the default home folder of your user (i.e. ``odm``) the path to the install will be ``/home/odm/ODM`` (abbreviated as ``~/ODM/``). If you want to save download bandwidth, you can compress the orthophoto using GDAL. Don’t add overviews, do that on your local machine to avoid making the file bigger before downloading it. In order to prevent a crash wherein the split-merge process fails to locate its own executable, we add the following lines to ``~/.bashrc`` (adjust paths if you’ve set things up differently from our example): Individual project directories, i.e. ``/mnt/odmdata/myproject/`` contain the gcp_list.txt file, the image_groups.txt file, and the images folder for each project``\` Install Launch the ODM process via ssh using nohup (so that if you’re cut off, processing will continue) Listing Docker Machines Modify settings.yaml to specify the parent directory of the project folder (in this case the Volume we created, ``/mnt/odmdata/``). Make sure the images are in the correct spot, i.e. ``/mnt/odmdata/myproject/images`` and the other ancillary files (gcp_list.txt and image_groups.txt) are in the root folder ``/mnt/odmdata/myproject/`` Note that the ODM github readme contains a slight error, the install directory name will be ODM, not OpenDroneMap (you’ll see this if you compare the above instructions to the ones on the ODM GitHub). Note that this assumes you have an image_groups.txt file. If not, this ``-split-overlap 0`` will probably fuck things up, and the ``--split 1`` is literally a random number that will be ignored after the image_groups.txt file is loaded (I think it normally controls how many groups it splits a set of images into, but in our case we’re assuming the images are already grouped sensibly). If you don’t have a large dataset (>1000 images), omit the ``--split`` and ``--split-overlap`` options. Note: as of 2020-03 the normal incantation ``python run.py -i /path/to/image/folder project_name`` seems *not* to work; the ``-i`` or ``--image`` parameter causes a weird error. So we drop the -i parameter, and rely on the project directory line in the settings.yaml file to direct ODM to the right place. Now using (including a split-merge): Now push your images onto the server. You can use `Secure Copy (scp) <https://en.wikipedia.org/wiki/Secure_copy>`__ like so: ``scp -r /path/to/my/imagefolder odm@xxx.xxx.xxx.xxx:/mnt/odmdata/``. Now we are logged into our docker instance and can explore the machine. Now you’ll need a second cloud hard drive (a “Volume” in Digital Ocean jargon) big enough to manage your project. Rule of thumb seems to be 10 times the size of your raw image set; we’ve got a 100GB image set and set up a 1000GB volume (once the run is done you should be able to get rid of most of this expensive drive capacity, but it’s needed to complete the process). Set up the volume, attach it to your droplet, and `configure its mount point <https://www.digitalocean.com/docs/volumes/how-to/mount/>`__ (in this example we’re setting it to ``/mnt/odmdata/``). ODM requires the directories on the machine to be set up just so. The critical bits are the install folder (if you installed as above, it’s ``/home/odm/ODM/``) and the project folder (i.e. ``/mnt/odmdata/myproject/``) ODM’s settings.yaml file specifies a single parent directory containing all projects. This is what goes in the project path line of the settings.yaml file (slightly confusingly, this is actually the *parent* directory of the individual project directories, which are specified by the project name parameter when calling ODM). Edit settings.yaml and set the project_path parameter to (as per our example setup) ``/mnt/odmdata/``, which in this case points to the Volume we created. Individual project directories are created within that. Once you get the file on your local computer, you can use QGIS to add overviews (“pyramids”) or use the GDAL command ``gdaladdo -r average /path/to/image.tif 2 4 8 16 32 64 128 256 512 1024``. Overall the ``--smrf-threshold`` option has the biggest impact on results. Prep data and project Pressing `Enter` or `Space`, arrow keys or `Page Up` or `Page Down` keys will now help us navigate through the logs. The lower case letter `Q` will let us escape back to the command line. Resize droplet, pull pin, run away SMRF is good at avoiding Type I errors (small number of ground points mistakenly classified as non-ground) but only "acceptable" at avoiding Type II errors (large number non-ground points mistakenly classified as ground). This needs to be taken in consideration when generating DTMs that are meant to be used visually, since objects mistaken for ground look like artifacts in the final DTM. Should be an Ubuntu 18.04 instance to ensure dependency compatibility Shut down and resize your machine to an appropriately monstrous number of CPUs and amount of memory. I use the memory-optimized machine with 24 dedicated vCPUs and 192GB of RAM (which costs about $1.60/hr—which adds up fast, it’s over $1000/month). Restart, and get to work quickly so as not to waste expensive big-droplet time. Since many users employ docker to deploy OpenDroneMap, it can be useful to understand some basic commands in order to interrogate the docker instances when things go wrong, or we are curious about what is happening. Docker is a containerized environment intended, among other things, to make it easier to deploy software independent of the local environment. In this way, it is similar to virtual machines. Sometimes we need to go a little deeper in our exploration of the process for OpenDroneMap. For this, we can get direct command line access to the machines. For this, we can use `docker exec` to execute a `bash` command line shell in the machine of interest as follows: Start the machine back up, and log in via ssh. Steps The images folder, i.e. ``/mnt/odmdata/myproject/images/`` contains all of the images. If you set it up like this, the images don’t get re-copied because they’re already in the directory that ODM wants them in. The value `-5` tells the tail command to give us just the last 5 lines of the logs. The whole process is mostly targeted at someone flying substantial missions in an African or similar location looking to process data ASAP while still in a field setting. Therefore it emphasizes a workflow intended to reduce bandwidth/data transfer, rather than just the simplest way of running ODM. There are some environmental variables that need to be set. Open the ~/.bashrc file on your machine and add the following 3 lines at the end (From `the ODM github <https://github.com/OpenDroneMap/ODM>`__). The file can be opened with ``nano ~/.bashrc`` (or whatever text editor you use in lieu of nano). Be sure to replace ``/home/odm/`` with the correct path to the location where you extracted OpenDroneMap if you didn’t do everything exactly as in our example (for example if you used a different username in your server setup): This is likely to be unwieldy large, but we can use a pipe `|` character and other tools to extract just what we need from the logs. For example we can move through the log slowly using the `more` command: This points ODM at the folder (in this example) ``/mnt/odmdata/myproject/``. Provided the image_groups.txt and gcp_list.txt are in this folder, the images are in ``/mnt/odmdata/myproject/images/``, and the project path in settings.yaml is ``/mnt/odmdata/`` it will not waste time and space copying images. This pushes the entire folder full of images (that’s what the ``-r`` option does, “recursive”) into the remote location (in our example, into the volume we attached to the cloud machine at ``/mnt/odmdata/``. This will take some bandwidth. No way around the size of the files.\ `1 <#footnote1>`__, \ `2 <#footnote2>`__\ To get good 2D and 2.5D (digital elevation model) results, you will require 42% overlap and sidelap for an equivalent 70% overlap and sidelap. To mitigate this effect, there are a few options but the simplest are as follows: fly two patterns separated by 20°, and rather than having a nadir (straight down pointing) camera, use one that tilts forward by 5°. Tutorials Two other important parameters affect DEM generation: Using Docker Using ODM from low-bandwidth location Using either the `CONTAINER ID` or the name, we can access any logs available on the machine as follows: Vertically separated flight lines also improve accuracy, but less so than a camera that is forward facing by 5°. Via `Ivan Gayton's repo <https://github.com/ivangayton/GDAL_scripts/>`_. We can also extract just the end of the logs using the `tail` commmand as follows: We can start by listing available docker machines on the current machine we are running as follows: What is this and who is it for? Without any parameter tweaks, ODM chooses a good compromise between quality, speed and memory usage. If you want to get higher quality results, you need to tweak some parameters: You can archive the odm_texturing, odm_georeferencing, and odm-dem folders using tar to make them easier to download in one piece (and maybe smaller). You may want to keep an eye on htop (to get a sense of the resource usage so that in future you can only spin up a machine as large as necessary) `OpenDroneMap <https://www.opendronemap.org/>`__ can’t always be effectively set up locally—it takes a fairly powerful machine to process large datasets—so a cloud machine can sometimes be the answer for people in the field. However, bandwidth is a problem in many low-income settings. This constraint can’t be solved completely, but the following method does a reasonable job of reducing the bandwidth needed to process drone imagery datasets on the cloud from African locations. ``--dem-gapfill-steps`` which determines the number of progressive DEM layers to use. For urban scenes increasing this value to `4-5` can help produce better interpolation results in the areas that are left empty by the SMRF filter. ``--dem-resolution`` which sets the output resolution of the DEM raster (cm/pixel) ``--ignore-gsd`` is a flag that instructs ODM to skip certain memory and speed optimizations that directly affect the orthophoto. Using this flag will increase runtime and memory usage, but may produce sharper results. ``--mesh-size`` should be increased to ``300000-600000`` and ``--mesh-octree-depth`` should be increased to ``10-11`` in urban areas to recreate better buildings / roofs. ``--orthophoto-resolution`` is the resolution of the orthophoto in cm/pixel. Decrease this value for a higher resolution result. ``--smrf-scalar`` scaling value. Increase this parameter for terrains with lots of height variation. ``--smrf-slope`` slope parameter, which is a measure of "slope tolerance". Increase this parameter for terrains with lots of height variation. Should be set to something higher than 0.1 and not higher than 1.2. ``--smrf-threshold`` elevation threshold. Set this parameter to the minimum height (in meters) that you expect non-ground objects to be. ``--smrf-window`` window radius parameter (in meters) that corresponds to the size of the largest feature (building, trees, etc.) to be removed. Should be set to a value higher than 10. ``--texturing-data-term`` should be set to `area` in forest areas. ``--texturing-nadir-weight`` should be increased to ``29-32`` in urban areas to reconstruct better edges of roofs. It should be decreased to ``0-6`` in grassy / flat areas. if you have the images in separate folders for individual AOI blocks or flights (which you will if your flight management was organized), you can create an image_groups.txt file with the incantations ``for i in *; do cd $i; for j in *; do echo "$j $i" >> ../$i.txt; done; cd ../; done;`` and ``cd ../``, ``for i in myproject/*.txt; do cat $i >> image_groups.txt; done;``. That should create a file with the correct structure: a list of all image files and a “group name” after each one (which in this case will simply be the name of the folder it came from). Then move all of the image files into a single directory called images in the project root dir (so ``/mnt/odmdata/myproject/images/``). The image_groups.txt file will allow ODM to keep track of which images belong to the same batch, even though they’re all in a single directory. Project-Id-Version: OpenDroneMap 2.0.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-10-05 13:29-0400
PO-Revision-Date: 2020-07-21 21:10+0000
Last-Translator: danbjoseph <danbjoseph@gmail.com>, 2020
Language: ar
Language-Team: Arabic (https://www.transifex.com/americanredcross/teams/111882/ar/)
Plural-Forms: nplurals=6; plural=n==0 ? 0 : n==1 ? 1 : n==2 ? 2 : n%100>=3 && n%100<=10 ? 3 : n%100>=11 && n%100<=99 ? 4 : 5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
 * تأثير البولينج على السحابة النقطية أكثر من 13000 مجموعة بيانات للصور تم جمعها من قبل البنك الدولي في تنزانيا حول حوض الفيضانات المعرض للفيضانات ، دار السلام ، تنزانيا. * يمكن لبعض الأوامر البسيطة أن تجعل تجربة docker أفضل بكثير. الوصول إلى السجلات على سبيل المثال بعد الانتهاء (بافتراض أنك تعيش طويلاً) بدلاً من ذلك ، يمكنك استخدام شاشة GNU لبدء العملية من جلسة الشاشة التي لن تتوقف إذا انقطع اتصالك ؛ قم بتشغيل `` الشاشة '' ، واستخدم `` <ctrl> a <ctrl> d '' لفصل "الشاشة - r" لإعادة توصيلها. لكن استخدام الشاشة لن ​​يمنحك ملف سجل لجميع مخرجات وحدة التحكم ما لم تفعل شيئًا محددًا لالتقاط ذلك ، بينما يمنحك nohup ملفًا يحتوي على جميع مخرجات وحدة التحكم ، بما في ذلك رسائل الخطأ ، مجانًا بدلاً من ذلك ، يمكن تطبيق الطريقة التجريبية التالية: حلّق بتداخل أقل بكثير ، لكن رحلتين * متصالبتين * (تسمى أحيانًا التقاطع المائل) مفصولتين بزاوية 20 درجة مع كاميرا أمامية 5 درجات. بمجرد الانتهاء من المعالجة ، أغلق الماكينة وقم بتغيير حجمها مرة أخرى إلى الحد الأدنى للسعة غير المكلفة. نظرًا لأن هذا النهج في الطيران يمكن أن يستغرق وقتًا أطول من الرحلات النموذجية ، يمكن للطيار أو الفريق أن يطير في منطقة صغيرة باستخدام النهج أعلاه. ستقوم OpenDroneMap بإنشاء ملف معايرة يسمى camera.json يمكن استيراده بعد ذلك لاستخدامه لمعايرة رحلة أخرى يتم نقلها بكفاءة أكبر. ستجد أدناه تعليمات لبعض حالات الاستخدام الشائعة. بشكل افتراضي لا يُنشئ ODM DEMs. لإنشاء نموذج تضاريس رقمي ، تأكد من تمرير علامة "--dtm". لإنشاء نموذج سطح رقمي ، تأكد من تمرير علامة "--dsm". معايرة الكاميرا تعد معايرة الأميرة تحديًا خاصًا مع كاميرات السلع. يمكن أن تؤثر التغيرات في درجات الحرارة والاهتزازات والتركيز والعوامل الأخرى على المعلمات المشتقة مع تأثيرات كبيرة على البيانات الناتجة. المعايرة التلقائية أو الذاتية ممكنة ومرغوب فيها مع رحلات الطائرات بدون طيار ، ولكن اعتمادًا على نمط الرحلة ، قد لا تؤدي المعايرة التلقائية إلى إزالة كل التشويه من المنتجات الناتجة. جيمس وروبسون (2014) في ورقتهما بعنوان `` التخفيف من الخطأ المنهجي في النماذج الطبوغرافية المشتقة من الطائرات بدون طيار وشبكات الصور الأرضية <https://onlinelibrary.wiley.com/doi/full/10.1002/esp.3609> "_ معالجة كيف لتقليل التشويه من المعايرة الذاتية. يمكن أن يؤثر تغيير هذه الخيارات على نتيجة DTM بشكل كبير. أفضل مصدر للقراءة لفهم كيفية تأثير المعلمات على الإخراج هو قراءة الورقة الأصلية `مرشح مورفولوجي بسيط محسن لتصنيف التضاريس لبيانات LIDAR المحمولة جواً <https://www.researchgate.net/publication/258333806_An_Improved_Simple_Morphological_Filter_for_the_Terrain_Classification_of_AirDatae_LIDAR_DATA>`_ (PDF متاح مجانًا). التنظيف بعد Docker وصول سطر الأوامر إلى المثيلات قم بإنشاء قطرة محيط رقمية مع ذاكرة وصول عشوائي بسعة 4 جيجابايت على الأقل. سيكلفك ذلك حوالي 20 دولارًا / شهريًا. من المحتمل أن يفشل التثبيت أقل من 4 غيغابايت من ذاكرة الوصول العشوائي. عندما نقوم بتشغيل عملية ODM فعليًا ، سنقوم بتغيير حجمها إلى جهاز سحابي أكبر بكثير وأكثر تكلفة ، ولكن بين الجري يمكنك تقليصها بين الجري إلى ثاني أرخص قطيرة والتي تكلف 10 دولارات فقط في الشهر (أرخص قطرة ، بسعر 5 دولارات شهريًا ، ويأتي مع محرك أقراص صغير لا يمكنك تقليصه). Create a user with sudo privileges. `Digital Ocean’s insanely good documentation <https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04>`__ can help you figure this out. In our case we set up a user called ``odm``, so connecting to it is via the command ``ssh odm@xxx.xxx.xxx.xxx`` (where the x’s stand for the IPv4 address of your server). If you want to follow this example closely, *do* use the username ``odm``; then your install path will be ``/home/odm/ODM/`` and will match all of the examples in this document. إنشاء نماذج الارتفاعات الرقمية إنشاء Orthophotos عالية الجودة مكن أن تكون نسب التداخل بين خطوط الشبكة أقل من الرحلات المتوازية. للحصول على نتائج جيدة ثلاثية الأبعاد ، ستحتاج إلى تداخل 68٪ و sidelap لما يعادل 83٪ تداخل و sidelap. بنية الدليل تمتع Docker باستخدام مؤسف للمساحة ولا يقوم افتراضيًا بتنظيف البيانات والآلات الزائدة عند اكتمال العمليات. يمكن أن يكون ذلك مفيدًا إذا احتجنا إلى الوصول إلى عملية تم إنهاؤها منذ ذلك الحين ، ولكنها تحمل عبء استخدام كميات متزايدة من التخزين بمرور الوقت. يقدم Maciej Łebkowski `نظرة عامة ممتازة على كيفية إدارة الاستخدام الزائد للقرص في عامل الميناء <https://lebkowski.name/docker-volumes/>` _. قم بتنزيل وتثبيت ODM عليه من `ODM Github <https://github.com/OpenDroneMap/ODM>` __ (عادي ، وليس WebODM) باستخدام الأوامر التالية: التنزيل باستخدام scp: ``scp odm@xxx.xxx.xxx.xxx:/mnt/odmdata/myproject/odm_orthophoto/odm_orthophoto.tif`` (أو احصل على النسخة المضغوطة التي أنشأتها في الخطوة الأخيرة)  مثال على كيفية إنشاء DTM :: اتبع التقدم باستخدام الذيل (حتى تعرف متى يتم ذلك) بالنسبة لتوليد DTM ، يتم استخدام مرشح مورفولوجي بسيط (smrf) لتصنيف النقاط في الأرض مقابل غير الأرض ويتم استخدام نقاط الأرض فقط. يمكن التحكم في مرشح `` smrf '' من خلال عدة معلمات: من James and Robson (2014), `CC BY 4.0 <https://creativecommons.org/licenses/by/4.0>`_ Go ahead and execute ``sudo apt update`` and ``sudo apt upgrade`` to ensure your server isn’t dangerously without updates. Make sure to stay with Ubuntu 18.04. نقدم هنا عملية صعبة ولكنها عملية لإنشاء جهاز سحابة OpenDroneMap (* لا * CloudODM ، ضع في اعتبارك أنه مجرد نسخة مستندة إلى السحابة من ODM تقوم بتشغيلها من سطر الأوامر) واستخدامها لمعالجة مجموعات الصور الكبيرة عن بُعد. إنه يتطلب معرفة باستخدام سطر أوامر Unix و ssh وحساب Digital Ocean (قد يعمل Amazon AWS أيضًا ، ربما مع اختلافات طفيفة في الإعداد) ، ومستوى معتدل من معرفة الكمبيوتر العامة. إذا لم تكن على دراية بالكمبيوتر إلى حد ما وترغب في إثارة ضجة مع إعداد صعب قليلاً ، فإن "CloudODM <https://www.opendronemap.org/cloudodm/>" __ هو ما يجب أن تنظر إليه. إذا أردنا رؤية الأجهزة التي قد لا تعمل ولكنها لا تزال موجودة ، فيمكننا إضافة علامة "-a": إذا قمت بذلك من المجلد الرئيسي الافتراضي للمستخدم (أي `` odm '') ، فسيكون المسار إلى التثبيت هو '' home / odm / ODM '' (يُختصر باسم `` ~ / ODM / ''). إذا كنت تريد حفظ النطاق الترددي للتنزيل ، يمكنك ضغط الصورة التقويمية باستخدام GDAL. لا تضيف نظرة عامة ، افعل ذلك على جهازك المحلي لتجنب تكبير الملف قبل تنزيله. لمنع حدوث عطل حيث تفشل عملية الدمج المقسم في تحديد موقع الملف التنفيذي الخاص بها ، نضيف الأسطر التالية إلى ``~/.bashrc`` (اضبط المسارات إذا قمت بإعداد الأشياء بشكل مختلف عن مثالنا): دلائل المشروع الفردية ، أي``/mnt/odmdata/myproject/`` `تحتوي على ملف gcp_list.txt ، ملف image_groups.txt ، ومجلد الصور لكل مشروع``\` تثبيت ابدأ تشغيل عملية ODM عبر ssh باستخدام nohup (بحيث إذا تم قطع الاتصال ، فستستمر المعالجة) ادراج Docker ماكينات قم بتعديل settings.yaml لتحديد الدليل الأصلي لمجلد المشروع (في هذه الحالة المجلد الذي أنشأناه ، `` / mnt / odmdata / ``). تأكد من أن الصور في الموضع الصحيح ، مثل  ``/mnt/odmdata/myproject/images`` والملفات المساعدة الأخرى (gcp_list.txt و image_groups.txt) في المجلد الجذر ``/mnt/odmdata/myproject/`` لاحظ أن الملف التمهيدي لـ github الخاص بـ ODM يحتوي على خطأ بسيط ، سيكون اسم دليل التثبيت هو ODM ، وليس OpenDroneMap (سترى هذا إذا قارنت الإرشادات المذكورة أعلاه بالإرشادات الموجودة على ODM GitHub). لاحظ أن هذا يفترض أن لديك ملف image_groups.txt. إذا لم يكن الأمر كذلك ، فمن المحتمل أن يؤدي هذا "-split-interap 0" إلى تلاعب الأمور ، و "--plit 1" هو حرفيا رقم عشوائي سيتم تجاهله بعد تحميل ملف image_groups.txt (أعتقد ذلك تتحكم عادةً في عدد المجموعات التي تقوم بتقسيم مجموعة من الصور إليها ، ولكن في حالتنا نحن نفترض أن الصور مجمعة بالفعل بشكل معقول). إذا لم يكن لديك مجموعة بيانات كبيرة (> 1000 صورة) ، فاحذف خياري "- تقسيم" و "- تقسيم متداخل". ملاحظة: اعتبارًا من 2020-03، يبدو أن التعطيل العادي `` python run.py -i /path/to/image/folder project_nam '' يبدو * غير * يعمل ؛ تؤدي المعلمة "-i" أو "--image" إلى حدوث خطأ غريب. لذا نسقط المعلمة -i ، ونعتمد على سطر دليل المشروع في ملف settings.yaml لتوجيه ODM إلى المكان الصحيح. الآن باستخدام (بما في ذلك الدمج المقسم): الآن ادفع صورك إلى الخادم. يمكنك استخدام `Secure Copy (scp) <https://en.wikipedia.org/wiki/Secure_copy>`__ مثل ذلك: ``scp -r /path/to/my/imagefolder odm@xxx.xxx.xxx.xxx:/mnt/odmdata/``. الآن تم تسجيل دخولنا إلى مثيل عامل الميناء لدينا ويمكننا استكشاف الجهاز. ستحتاج الآن إلى محرك أقراص ثابت سحابي ثانٍ ("حجم" في المصطلح الرقمي للمحيط) كبير بما يكفي لإدارة مشروعك. يبدو أن القاعدة الأساسية هي 10 أضعاف حجم مجموعة صورك الخام ؛ لدينا مجموعة من الصور بحجم 100 جيجابايت وقمنا بإعداد وحدة تخزين بحجم 1000 جيجابايت (بمجرد الانتهاء من التشغيل ، يجب أن تكون قادرًا على التخلص من معظم سعة محرك الأقراص الباهظة الثمن هذه ، ولكن يلزم إكمال العملية). قم بإعداد الصوت وإرفاقه بالقطرة الخاصة بك ، و `تكوين نقطة التحميل الخاصة به <https://www.digitalocean.com/docs/volumes/how-to/mount/>`__ (في هذا المثال ، نقوم بتعيينه إلى ``/mnt/odmdata/``). يتطلب ODM إعداد الدلائل الموجودة على الجهاز فقط. البتات الحرجة هي مجلد التثبيت (إذا قمت بتثبيته كما هو موضح أعلاه ، فهو ``/home/odm/ODM/`` ومجلد المشروع (i.e. ``/mnt/odmdata/myproject/``)) يحدد ملف settings.yaml الخاص بـ ODM دليل أصل واحد يحتوي على كافة المشاريع. هذا هو ما يحدث في سطر مسار المشروع لملف settings.yaml (بشكل مثير للارتباك قليلاً ، هذا في الواقع هو الدليل * الأصل * لأدلة المشروع الفردية ، والتي يتم تحديدها بواسطة معلمة اسم المشروع عند استدعاء ODM). قم بتحرير الإعدادات. yaml وقم بتعيين معلمة project_path إلى (وفقًا لإعداد المثال الخاص بنا) ``/mnt/odmdata/`` ، والتي تشير في هذه الحالة إلى المجلد الذي أنشأناه. يتم إنشاء أدلة المشاريع الفردية في ذلك. بمجرد الحصول على الملف على جهاز الكمبيوتر المحلي الخاص بك ، يمكنك استخدام QGIS لإضافة نظرة عامة ("الأهرامات") أو استخدام أمر GDAL  ``gdaladdo -r average /path/to/image.tif 2 4 8 16 32 64 128 256 512 1024``. بشكل عام ، فإن خيار "- smrf-threshold" له أكبر الأثر على النتائج. إعداد البيانات والمشروع الضغط على `Enter` أو` Space` أو مفاتيح الأسهم أو `Page Up` أو` Page Down` سيساعدنا الآن في التنقل عبر السجلات. الحرف الصغير `Q` سيتيح لنا الهروب إلى سطر الأوامر. تغيير حجم القطرة ، وسحب دبوس ، والهروب SMRF جيد في تجنب أخطاء النوع الأول (عدد صغير من نقاط الأرض المصنفة خطأً على أنها غير أرضية) ولكنها "مقبولة" فقط في تجنب أخطاء النوع الثاني (عدد كبير من النقاط غير الأرضية مصنفة خطأً كأرضية). يجب أن يؤخذ هذا في الاعتبار عند إنشاء DTMs التي من المفترض أن يتم استخدامها بصريًا ، لأن الكائنات التي تم الخلط بينها وبين الأرض تبدو وكأنها قطع أثرية في DTM النهائية. يجب أن يكون نسخة Ubuntu 18.04 لضمان توافق التبعية قم بإيقاف تشغيل جهازك وتغيير حجمه إلى عدد هائل من وحدات المعالجة المركزية وكمية الذاكرة المناسبة. أستخدم الجهاز المُحسّن للذاكرة مع 24 وحدة vCPU مخصصة و 192 غيغابايت من ذاكرة الوصول العشوائي (والتي تكلف حوالي 1.60 دولارًا في الساعة - والتي تضيف بسرعة ، تزيد عن 1000 دولار / شهر). إعادة التشغيل ، والبدء في العمل بسرعة حتى لا تضيع وقتًا كبيرًا. نظرًا لأن العديد من المستخدمين يستخدمون عامل إرساء لنشر OpenDroneMap ، فقد يكون من المفيد فهم بعض الأوامر الأساسية من أجل استجواب حالات عامل الميناء عندما تسوء الأمور ، أو نشعر بالفضول حيال ما يحدث. Docker هي بيئة حاويات تهدف ، من بين أمور أخرى ، إلى تسهيل نشر البرامج بشكل مستقل عن البيئة المحلية. بهذه الطريقة ، فهي تشبه الأجهزة الافتراضية. في بعض الأحيان نحتاج إلى التعمق أكثر في استكشافنا لعملية OpenDroneMap. لهذا ، يمكننا الحصول على وصول مباشر لسطر الأوامر إلى الأجهزة. لهذا ، يمكننا استخدام `docker exec` لتنفيذ قذيفة سطر الأوامر` bash` في الجهاز المعني على النحو التالي: قم بتشغيل الجهاز احتياطيًا ، وقم بتسجيل الدخول عبر ssh. خطوات يحتوي مجلد الصور ، أي ```/mnt/odmdata/myproject/images/`` على جميع الصور. إذا قمت بإعداده على هذا النحو ، فلن تتم إعادة نسخ الصور لأنها موجودة بالفعل في الدليل الذي يريدها ODM. تخبر القيمة `-5` الأمر tail بإعطائنا الأسطر الخمسة الأخيرة فقط من السجلات. تستهدف العملية برمتها في الغالب شخصًا يقوم بمهام كبيرة في موقع أفريقي أو موقع مماثل يتطلع إلى معالجة البيانات في أسرع وقت ممكن بينما لا يزال في بيئة ميدانية. ولذلك ، فإنه يؤكد على سير العمل الذي يهدف إلى تقليل نقل البيانات / النطاق الترددي ، بدلاً من أبسط طريقة لتشغيل ODM. هناك بعض المتغيرات البيئية التي يجب تحديدها. افتح ملف ~/.bashrc على جهازك وأضف الأسطر الثلاثة 3 في النهاية (من `github ODM <https://github.com/OpenDroneMap/ODM>` __). يمكن فتح الملف باستخدام ``nano ~/.bashrc`` (أو أي محرر نصوص تستخدمه بدلاً من nano). تأكد من استبدال ``/home/odm/`` بالمسار الصحيح إلى الموقع الذي قمت باستخراج OpenDroneMap إذا لم تفعل كل شيء تمامًا كما في مثالنا (على سبيل المثال إذا كنت تستخدم اسم مستخدم مختلفًا في إعداد الخادم الخاص بك) : من المحتمل أن يكون هذا كبير الحجم غير عملي ، ولكن يمكننا استخدام حرف `|` للأنبوب وأدوات أخرى لاستخراج ما نحتاجه فقط من السجلات. على سبيل المثال ، يمكننا التنقل عبر السجل ببطء باستخدام الأمر `more`: هذا يشير إلى ODM في المجلد (في هذا المثال) ```/mnt/odmdata/myproject/``. بشرط أن يكون ملف image_groups.txt و gcp_list.txt في هذا المجلد ، فإن الصور موجودة في ``/mnt/odmdata/myproject/images/`` ، ومسار المشروع في الإعدادات. yaml هو ``/mnt/odmdata/``  لن تضيع الوقت ونسخ الصور الفضائية. يؤدي هذا إلى دفع المجلد بالكامل المليء بالصور (هذا ما يفعله الخيار "-r" ، "العودية") في الموقع البعيد (في مثالنا ، في الحجم الذي نعلقه على الجهاز السحابي على ``/mnt/odmdata/``. سيستغرق هذا بعض عرض النطاق الترددي. لا توجد طريقة حول حجم الملفات.\ `1 <#footnote1>`__, \ `2 <#footnote2>`__\ للحصول على نتائج جيدة ثنائية الأبعاد و 2.5 D (نموذج الارتفاع الرقمي) ، ستحتاج إلى 42٪ تداخل و sidelap للحصول على 70٪ تراكب و sidelap مكافئ. للتخفيف من هذا التأثير ، هناك عدد قليل من الخيارات ولكن أبسطها على النحو التالي: حلّق بنمطين مفصولين بـ 20 درجة ، وبدلاً من أن يكون لديك كاميرا (إشارة مستقيمة لأسفل) ، استخدم واحدًا يميل إلى الأمام بمقدار 5 درجات. دروس هناك معلمتان مهمتان أخريان تؤثران على توليد DEM: باستخدام  Docker استخدام ODM من موقع النطاق الترددي المنخفض باستخدام "  CONTAINER ID" أو الاسم ، يمكننا الوصول إلى أي سجلات متاحة على الجهاز على النحو التالي: كما تحسن خطوط الطيران المنفصلة عموديًا الدقة ، ولكنها أقل دقة من الكاميرا التي تواجه الأمام بمقدار 5 درجات. عبر  `Ivan Gayton's repo <https://github.com/ivangayton/GDAL_scripts/>`_ يمكننا أيضًا استخراج نهاية السجلات فقط باستخدام أمر "الذيل" كما يلي: يمكننا البدء بإدراج آلات الرصيف المتوفرة على الجهاز الحالي الذي نقوم بتشغيله على النحو التالي: ما هذا ومن هو؟ بدون أي تعديلات في المعلمات ، يختار ODM حل وسط جيد بين الجودة والسرعة واستخدام الذاكرة. إذا كنت ترغب في الحصول على نتائج عالية الجودة ، فأنت بحاجة إلى تعديل بعض المعلمات: يمكنك أرشفة مجلدات odm_texturing و odm_georeferencing و odm-dem باستخدام tar لتسهيل عملية التنزيل في قطعة واحدة (وربما أصغر). قد ترغب في مراقبة htop (للحصول على فكرة عن استخدام الموارد حتى تتمكن في المستقبل من تدوير آلة كبيرة بقدر الضرورة) <https://www.opendronemap.org/>" __ لا يمكن دائمًا إعدادها بشكل فعال محليًا - يتطلب الأمر جهازًا قويًا إلى حد ما لمعالجة مجموعات البيانات الكبيرة - لذا يمكن أن تكون الآلة السحابية أحيانًا هي الحل للأشخاص في حقل. ومع ذلك ، فإن عرض النطاق الترددي يمثل مشكلة في العديد من الإعدادات منخفضة الدخل. لا يمكن حل هذا القيد تمامًا ، ولكن الطريقة التالية تؤدي مهمة معقولة لتقليل النطاق الترددي اللازم لمعالجة مجموعات بيانات صور الطائرات بدون طيار على السحابة من المواقع الأفريقية. "-dem-gapfill-steps '' الذي يحدد عدد طبقات DEM التقدمية التي سيتم استخدامها. بالنسبة للمشاهد الحضرية ، يمكن أن تساعد زيادة هذه القيمة إلى "4-5" في تحقيق نتائج أفضل في الاستيفاء في المناطق التي تُركت فارغة بواسطة مرشح SMRF. "--dem-Resolution '' الذي يضبط دقة خرج DEM النقطية (سم / بكسل) "--ignore-gsd" هي علامة توجه تعليمات ODM لتخطي بعض الذاكرة وتحسينات السرعة التي تؤثر بشكل مباشر على الصورة. سيؤدي استخدام هذه العلامة إلى زيادة وقت التشغيل واستخدام الذاكرة ، ولكن قد ينتج عنه نتائج أكثر وضوحًا. يجب زيادة ``mesh-size--`` إلى ``300000-600000`` و ``--mesh-octree-depth`` يجب زيادتها إلى ``10-11`` في المناطق الحضرية لإعادة إنشاء مباني / أسقف أفضل. Resolution '' هي دقة صورة Orthophoto بالسنتيمتر / بكسل. إنقاص هذه القيمة للحصول على نتيجة دقة أعلى. قيمة القياس `` - smrf-scalar ''. قم بزيادة هذه المعلمة للتضاريس مع الكثير من الاختلافات في الارتفاع. معلمة المنحدر `` - smrf-slope '' ، وهو مقياس لـ "تحمل المنحدر". قم بزيادة هذه المعلمة للتضاريس مع الكثير من الاختلافات في الارتفاع. يجب ضبطه على شيء أعلى من 0.1 وليس أعلى من 1.2. عتبة ارتفاع "- smrf-threshold". اضبط هذه المعلمة على الحد الأدنى للارتفاع (بالأمتار) الذي تتوقعه من الكائنات غير الأرضية. `` --smrf-window '' معلمة نصف قطر النافذة (بالأمتار) التي تتوافق مع حجم أكبر ميزة (المبنى والأشجار وما إلى ذلك) المراد إزالتها. يجب ضبطه على قيمة أعلى من 10. يجب تعيين ``--texturing-data-term`` على "المنطقة" في مناطق الغابات. يجب زيادة ``-texturing-nadir-weight`` إلى ``29-32`` في المناطق الحضرية لإعادة بناء حواف أفضل للأسقف. يجب تخفيضها إلى "0-6" في المناطق العشبية / المسطحة. إذا كانت لديك الصور في مجلدات منفصلة لكتل ​​أو رحلات طيران فردية (والتي ستفعلها إذا تم تنظيم إدارة رحلتك) ، فيمكنك إنشاء ملف image_groups.txt مع التعويذات ``لـ i in * ؛ هل cd $ i ؛ for j in *؛ do echo "$ j $ i" >> ../$i.txt؛ فعله؛ مؤتمر نزع السلاح ../ ؛ فعل ؛`` و ``cd ../`` ، ``لأني في myproject / *. txt ؛ do cat $ i >> image_groups.txt؛ فعل ؛``. من المفترض أن يؤدي ذلك إلى إنشاء ملف بهيكل صحيح: قائمة بجميع ملفات الصور و "اسم المجموعة" بعد كل ملف (والذي سيكون في هذه الحالة ببساطة اسم المجلد الذي جاء منه). ثم انقل جميع ملفات الصور إلى دليل واحد يسمى الصور في دليل جذر المشروع (لذا ``/mnt/odmdata/myproject/images/``). سيسمح ملف image_groups.txt لـ ODM بتتبع الصور التي تنتمي إلى نفس الدفعة ، على الرغم من أنها كلها في دليل واحد. 