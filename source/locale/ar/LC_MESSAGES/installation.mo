��    �      |              �  W   �  T   5	  �   �	  �   
  �   �
  �   �  �   (  Y   �  9   <     v     �  a   �  +     	   4     >     S      p  "   �     �     �  	   �     �     �  '     m   +  X   �  -  �  �      "        :     L  f   S  a   �  �     �   �  )  �  9   �      &  U   G  j   �  P       Y     s  $   �  �   �     0  "   4  >   W  �   �     $     =  �   L  6   �  :     i   V  X   �  �    U   �  M   9  P   �  �   �  X   j  ,   �  ]   �  C   N   h   �   �   �      �!     �!     �!     �!     "      %"     F"     \"  C   b"  �   �"  �   Q#  �   �#  �  �$  �  r'  �   )      �)  G   *  +   L*  z  x*  '   �+     ,  u   ,     �,     �,     �,     �,  D   �,  V   %-  8   |-  I   �-      �-      .  �   <.  $   �.     /  %   #/     I/  '   f/  "   �/     �/  "   �/     �/    0  @  !1  ;   b2  �   �2  Y   \3  1   �3  F   �3  f   /4  2   �4  '   �4  �   �4  �   �5  `   v6  -   �6  d  7    j8  w   �9  <   �9     5:  7   I:     �:  U  �:  Z   �;  +   :<  3   f<  1   �<  �   �<     �=  �   �=      F>    g>  �   �@  a   A  �   hA  L  ZB  %  �C  �   �D  x  �E  �   !G  G   �G  (   H  )   @H  �   jH  ;   �H  	   5I  7   ?I  >   wI  3   �I  ;   �I     &J  /   AJ     qJ  .   �J     �J  _   �J  �   9K  z   6L  �  �L  1  VN  P   �O     �O     �O  f   �O  a   bP  C  �P  P  R    YS  9   [U  -   �U  }   �U  �   AV  �  �V     �X  (   �X  :   �X  �   7Y     ,Z  "   0Z  >   SZ  �   �Z     V[     r[  �   �[  M   s\  a   �\  �   #]  �   �]  �  j^  �   Ia  x   �a  �   Nb  �   �b  �   �c  L   &d  �   sd  R   �d  �   Je  �  �e     ig  #   �g     �g  %   �g     �g     �g  ?   h     Vh  ~   \h  ?  �h  �   j  "  �j  �   l  �  �o  W  pr  *   �s  [   �s  ,   Ot  �  |t  8   kv     �v  �   �v  7   Fw     ~w     �w     �w  D   �w  �   
x  w   �x  �   'y  &   �y  /   �y  �   	z  J   �z  -   7{  A   e{  -   �{  d   �{  5   :|  (   p|  5   �|  (   �|  �  �|    �~  Q   ��     �  l   )�  A   ��  {   ؂  �   T�  9   �  0   )�  �  Z�  �   �  �   ��  :   �  .  P�  K  �  �   ˊ  S   ~�     ҋ  J   ��     ;�    C�  �   L�  :   ܎  =   �  0   U�  �   ��     ��  �   ��  -   W�   **CloudODM** is a small command line client to communicate with ODM via the NodeODM API **ClusterODM** is a load balancer for connecting together multiple NodeODM instances **NodeODM** is a light-weight API built on top of ODM. It allows users and applications to access the functions of ODM over a computer network **ODM** is the processing engine, which can be used from the command line. It takes images as input and produces a variety of outputs, including point clouds, 3D models and orthophotos **Optionally:** If you have another computer, you can repeat the installation process (install docker, git, python, etc.) and launch a new NodeODM node by typing from a Terminal/Git Bash window: **PyODM** is a Python SDK for creating tasks via the NodeODM API. We cover it in more detail in the “Automated Processing With Python” chapter **WebODM** is a friendly user interface that includes a map viewer, a 3D viewer, user logins, a plugin system and many other features that are expected of modern drone mapping platforms *Common keys to press at computer startup to access the boot menu for various PC vendors* *Console output after starting WebODM for the first time* *Docker advanced settings* *Docker app running* *Don’t forget to add the Python executable to your PATH (so that you can run commands with it)* *Git Gui after successful download (clone)* *Git Gui* *Step 1 Docker icon* *Step 3 & 4 Docker settings* *VirtualBox default VM settings* *Virtualization should be enabled* *WebODM Dashboard* 100 GB of disk space 16 GB RAM 20 GB of disk space 4 GB RAM 64bit CPU manufactured on or after 2010 Adjust the CPUs slider to use half of all available CPUs and the memory to use 60-70% of all available memory After installing docker you should find an icon that looks like a whale in the task bar. After installing docker, launch it from the Desktop icon that is created from the installation (**Docker Quickstart** in the case of Docker Toolbox, **Docker for Windows** for Docker for Windows). This is important, do not skip this step. If there are errors, follow the prompts on screen to fix them. After running ./webodm.sh start and opening WebODM in the browser, you will be greeted with a welcome message and will be asked to create the first user. Take some time to familiarize yourself with the web interface and explore its various menus. Basic Commands and Troubleshooting Commands to type: Docker Docker Toolbox: https://github.com/docker/toolbox/releases/download/v18.09.3/DockerToolbox-18.09.3.exe Docker for Windows: https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe Docker on Windows works by running a VM in the background (think of a VM as a “computer emulator”). This VM has a certain amount of memory allocated and WebODM can only use as much memory as it’s allocated. Docker on macOS works by running a VM in the background (think of it as a “computer emulator”). This VM has a certain amount of memory allocated and WebODM can only use as much memory as it’s allocated. Docker requires a feature from your CPU called virtualization, which allows it to run virtual machines (VMs). Make sure you have it enabled! Sometimes this is disabled. To check, on Windows 8 or higher you can open the **Task Manager** (press CTRL+SHIFT+ESC) and switch to the **Performance** tab. Docker: https://download.docker.com/mac/stable/Docker.dmg First, you’ll need to install: For Python 3, make sure you check **Add Python 3.x to PATH** during the installation. From Git Gui, go to the **Repository** menu, then click **Git Bash**. From the command line terminal type: From WebODM you can then press the **Add New** button under **Processing Nodes**. For the **hostname/IP** field type the IP of the second computer. For the **port** field type “3000”. For the **token** field type “secret”. You can also add an optional **label** for your node, such as “second computer”. Then press **Save**. From a **Terminal** type: From a terminal type: From the menu, press **Settings...** From the panel, click **Advanced** and use the sliders to allocate 60-70% of available memory and use half of all available CPUs. Git Git: https://git-scm.com/downloads Git: https://sourceforge.net/projects/git-osx-installer/files/ Go to the **Repository** menu, then click **Create Desktop Icon**. This will allow you to come back to this application easily in the future. Hardware Recommendations Hello, WebODM! If everything went well, you should now have two processing nodes! You will be able to process multiple tasks in parallel using two different machines. If instead you get something similar to the following: If the download succeeded, you should now see this window: If the result is *kern.hv_support: 0*, unfortunately it means your Mac is too old to run OpenDroneMap. :( If the result is *kern.hv_support: 1*, then your Mac is supported! Continue with Step 2. If virtualization is disabled, you’ll need to enable it. The procedure unfortunately is a bit different for each computer model, so the best way to do this is to look up on a search engine “how to enable vtx for <type your computer model here>”. Often times it’s a matter of restarting the computer, immediately pressing F2 or F12 during startup, navigating the boot menu and changing the settings to enable virtualization (often called “VT-X”). If you are on Windows 10 Professional or a newer version, you should install instead: If you are using Docker Toolbox, find the IP address to connect to by typing: If you are using Docker for Windows, open a web browser to http://localhost:8000 If you get a “bash: git: command not found”, try to restart your **Terminal** app and double-check for any errors during the install process. If you installed Docker Toolbox (see below if you installed Docker for Windows instead): If you installed Docker for Windows instead: If you’ve made it this far, congratulations! Now it’s time to start processing some data. In **Source Location** type: https://github.com/OpenDroneMap/WebODM In **Target Directory** click browse and navigate to a folder of your choosing (create one if necessary) In addition to the three programs above, the dockercompose script is also needed. Sometimes it’s already installed with docker, but sometimes it isn’t. To verify if it’s installed try to type: Install on Arch Install on CentOS / RHEL Install on Fedora Install on Ubuntu / Debian Installation Installation and Getting Started Latest Generation CPU Linux Look in the system tray and right click the “white whale” icon. Most modern (post 2010) Mac computers running macOS Sierra 10.12 or higher can run OpenDroneMap using docker, as long as hardware virtualization is supported (see below). No more than 100-200 images can be processed with the above specifications (the software will run out of memory). Recommended requirements are: Notice that under the **Processing Nodes** menu there’s a "node-odm-1" node already configured for you to use. This is a NodeODM node and has been created automatically by WebODM. This node is running on the same machine as WebODM. ODM, NodeODM and WebODM are available on all major platforms (Windows, macOS and Linux) via a program called docker, which is required to run the software. Docker offers a way to run “containers”. Containers are packaged copies of an entire system, its software and its dependencies. These containers run within a virtual environment. On Linux this virtual environment is available from the operating system and is very efficient. On macOS and Windows the containers run within a VM, so there’s a bit of a overhead. but it’s still very suitable for running the software. Once installed users do not have to worry much about docker, as it operates (almost) transparently. On Ubuntu Linux 18.04 it’s feasible to run all OpenDroneMap software natively. However, because there’s very little performance penalty for running docker on Linux and docker is straightforward to setup on this platform, we don’t recommend it. On Linux the advantages of containerization far outweigh a tiny performance penalty. With docker users also get easy one-step updates of the software, so that’s nice. On Windows 7 to see if you have virtualization enabled you can use the `Microsoft® Hardware-Assisted Virtualization Detection Tool <http:// www.microsoft.com/en-us/download/details.aspx?id=592>`_ instead. Open a Terminal window and type: Open the **Git Gui** program that comes installed with Git. From there: Open the **VirtualBox Manager** application OpenDroneMap can run on any Linux distribution that supports docker. According to `docker’s documentation website <https://docs.docker.com/install/>`_ the officially supported distributions are CentOS, Debian, Ubuntu and Fedora, with static binaries available for others. If you have to pick a distribution solely for running OpenDroneMap, Ubuntu is the recommended way to go. Other useful commands are listed below: Pip Please do **NOT** install both docker programs. They are different and will create a mess if they are both installed. Press **Apply & Restart** Press **Apply**. Press **Clone** Python (2 or 3) Python (latest version 3): https://www.python.org/downloads/windows/ Right click the **default** VM and press **Close (ACPI Shutdown)** to stop the machine Right click the **default** VM and press **Settings...** Right click the whale icon from the task bar and click **Preferences**... Running on more than one machine Select the **Advanced** tab Several components will download to your machine at this point, including WebODM, NodeODM and ODM. After the download you should be greeted by the following screen: Step 1. Check Virtualization Support Step 1. Install Requirements Step 2. Check Additional Requirements Step 2. Install Requirements Step 3. Check Memory and CPU Allocation Step 3. Download and Launch WebODM Step 4. Download WebODM Step 4. Download and Launch WebODM Step 4. Launch WebODM The above command asks docker to launch a new container using the opendronemap/nodeodm image from Docker Hub (the latest version of NodeODM), using port 3000, setting a maximum number of concurrent tasks to 1 and to protect the node from unauthorized access using the password "secret". The above will allow for a few hundred images to be processed without too many issues. A CPU with more cores will allow for faster processing, while a graphics card (GPU) currently has no impact on performance. For processing more images, add more disk space and RAM linearly to the number of images you need to process. The bare minimum requirements for running the software are: The cool thing about using docker is that 99% of the tasks you’ll ever need to perform while using WebODM can be done via the ./webodm.sh script. You have already encountered one of them: Then connect to http://192.168.1.100:8000 (replacing the IP address with the proper one). Then open a web browser to http://localhost:8000. Then press **OK**, right click the **default** VM and press **Start**. Then, only if you are on Windows 10 Home, Windows 8 (any version) or Windows 7 (any version), install: There are four programs that need to be installed: There are only two programs to install: There are several other commands you can use, along with different flags. Flags are parameters passed to the ./webodm.sh command and are typically prefixed with “–”. The **port** flag for example instructs WebODM to use a different network port: This section is excerpted and modified with permission from `OpenDroneMap: The Missing Guide <https://odmbook.com>`_, by Piero Toffanin. To run OpenDroneMap you need at least Windows 7. Previous versions of Windows are not supported. To verify that git is installed, simply type: Until recently OpenDroneMap was the term used to refer to a single command line application (what is now known as the ODM project).  With the recent development of a web interface, an API and other tools, OpenDroneMap has become an ecosystem of various applications to process, analyze and display aerial data. This ecosystem is made of several components: We cannot possibly cover the installation process for every Linux distribution out there, so we’ll limit the instructions to those that are distributions officially supported by docker. In all cases it’s just a matter of opening a terminal prompt and typing a few commands. We recommend people use `docker <https://www.docker.com>`_ for running ODM, whether you are on Windows, macOS or Linux. When Git Gui opens, click 'Clone Existing Repository' option Which should return Which should return something similar to the following: Windows Without docker it would not be possible to run ODM on Windows or macOS. On these platforms ODM cannot run natively. Future development efforts are being focused on leveraging the new Windows Subsystem for Linux (WSL) and the possibility to make a native port of all dependencies to macOS, which is going to make the installation much easier. You can verify that docker is running properly by opening the **Terminal** app and typing: You should get a result like the following: You should see somethings similar to the following: You will get a response similar to the following: `The community forum <https://community.opendronemap.org>`_ is a great place to ask for help if you     get stuck during any of the installation steps and for general questions on using the ./webodm.sh script. macOS which takes care of starting WebODM and setting up a default processing node (node-odm-1). If you want to stop WebODM, you can already guess what the command is: you can install it by using pip: Project-Id-Version: OpenDroneMap 2.0.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-12-15 09:17-0500
PO-Revision-Date: 2020-07-21 21:10+0000
Last-Translator: danbjoseph <danbjoseph@gmail.com>, 2020
Language: ar
Language-Team: Arabic (https://www.transifex.com/americanredcross/teams/111882/ar/)
Plural-Forms: nplurals=6; plural=n==0 ? 0 : n==1 ? 1 : n==2 ? 2 : n%100>=3 && n%100<=10 ? 3 : n%100>=11 && n%100<=99 ? 4 : 5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 ** CloudODM ** هو عميل سطر أوامر صغير للتواصل مع ODM عبر واجهة برمجة تطبيقات NodeODM ** ClusterODM ** هو موازن تحميل لربط أمثلة NodeODM المتعددة معًا ** NodeODM ** عبارة عن واجهة برمجة تطبيقات خفيفة الوزن مبنية على أعلى ODM. يسمح للمستخدمين والتطبيقات للوصول إلى وظائف ODM عبر شبكة الكمبيوتر ** ODM ** هو محرك المعالجة ، والذي يمكن استخدامه من سطر الأوامر. يأخذ الصور كمدخلات وينتج مجموعة متنوعة من المخرجات ، بما في ذلك الغيوم النقطية ، والنماذج ثلاثية الأبعاد والصور التقويمية **اختياريًا:** إذا كان لديك جهاز كمبيوتر آخر ، يمكنك تكرار عملية التثبيت (تثبيت docker و git و python وما إلى ذلك) وتشغيل عقدة NodeODM جديدة من خلال الكتابة من نافذة Terminal / Git Bash: ** PyODM ** هي Python SDK لإنشاء المهام عبر واجهة برمجة تطبيقات NodeODM. نغطيها بمزيد من التفصيل في فصل "المعالجة الآلية باستخدام Python" ** WebODM ** عبارة عن واجهة مستخدم سهلة الاستخدام تتضمن عارض خرائط وعارض ثلاثي الأبعاد وتسجيلات دخول المستخدمين ونظامًا إضافيًا والعديد من الميزات الأخرى المتوقعة من منصات رسم الخرائط الحديثة بطائرات بدون طيار * مفاتيح مشتركة للضغط عند بدء تشغيل الكمبيوتر للوصول إلى قائمة التمهيد لمختلف بائعي الكمبيوتر * *إخراج وحدة التحكم بعد بدء WebODM لأول مرة* *إعدادات Docker المتقدمة* *تطبيق Docker قيد التشغيل* * لا تنس إضافة Python القابل للتنفيذ إلى PATH الخاص بك (بحيث يمكنك تشغيل الأوامر به) * * Git Gui بعد نجاح التنزيل (استنساخ) * *Git Gui* * أيقونة الخطوة 1 عامل الميناء * * الخطوة 3 و 4 إعدادات عامل الميناء * *إعدادات VirtualBox الافتراضية VM* * يجب تمكين المحاكاة الافتراضية * *لوحة تحكم WebODM* 100 غيغابايت من مساحة القرص ذاكرة رام 16 جيجا 20 غيغابايت من مساحة القرص 4 جيجا بايت رام تم تصنيع وحدة المعالجة المركزية 64 بت في أو بعد عام 2010 اضبط شريط تمرير وحدات المعالجة المركزية لاستخدام نصف جميع وحدات المعالجة المركزية المتاحة والذاكرة لاستخدام 60-70٪ من جميع الذاكرة المتاحة بعد تثبيت عامل الميناء ، يجب أن تجد رمزًا يشبه الحوت في شريط المهام. بعد تثبيت docker ، قم بتشغيله من أيقونة سطح المكتب التي تم إنشاؤها من التثبيت (** Docker Quickstart ** في حالة Docker Toolbox ، ** Docker for Windows ** for Docker for Windows). هذا مهم ، لا تتخطى هذه الخطوة. إذا كانت هناك أخطاء ، فاتبع المطالبات التي تظهر على الشاشة لإصلاحها. بعد تشغيل .webodm.sh/ بدء وفتح WebODM في المتصفح ، سيتم الترحيب بك برسالة ترحيب وسيطلب منك إنشاء المستخدم الأول. خصص بعض الوقت للتعرف على واجهة الويب واستكشاف قوائمها المختلفة. الأوامر الأساسية واستكشاف الأخطاء وإصلاحها أوامر للكتابة: Docker Docker Toolbox: https://github.com/docker/toolbox/releases/download/v18.09.3/DockerToolbox-18.09.3.exe Docker for Windows: https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe يعمل Docker على Windows عن طريق تشغيل VM في الخلفية (فكر في VM كـ "محاكي كمبيوتر"). يحتوي هذا الجهاز الظاهري على مقدار معين من الذاكرة المخصصة ولا يمكن أن يستخدم WebODM سوى قدر الذاكرة المخصصة. عمل Docker على macOS عن طريق تشغيل VM في الخلفية (فكر في الأمر على أنه "محاكي كمبيوتر"). يحتوي هذا الجهاز الظاهري على مقدار معين من الذاكرة المخصصة ولا يمكن أن يستخدم WebODM سوى قدر الذاكرة المخصصة. يتطلب Docker ميزة من وحدة المعالجة المركزية الخاصة بك تسمى المحاكاة الافتراضية ، والتي تسمح لها بتشغيل الأجهزة الافتراضية (VMs). تأكد من تمكينه! في بعض الأحيان يتم تعطيل هذا. للتحقق ، في Windows 8 أو أعلى ، يمكنك فتح **Task Manager** (اضغط CTRL + SHIFT + ESC) والتبديل إلى علامة التبويب علامة التبويب **الأداء**. Docker: https://download.docker.com/mac/stable/Docker.dmg أولاً ، ستحتاج إلى تثبيت: بالنسبة إلى Python 3 ، تأكد من تحديد ** إضافة Python 3.x إلى PATH ** أثناء التثبيت. من Git Gui ، انتقل إلى قائمة **Repository** ، ثم انقر فوق **Git Bash**. من نوع سطر الأوامر: من WebODM يمكنك بعد ذلك الضغط على زر **Add New** تحت **Nodes العقد**. بالنسبة للحقل **hostname / IP** ، اكتب عنوان IP للكمبيوتر الثاني. بالنسبة للحقل **المنفذ** ، اكتب "3000". بالنسبة إلى الحقل **الرمز المميز** ، اكتب "سري". يمكنك أيضًا إضافة **تسمية** اختيارية للعقدة ، مثل "الكمبيوتر الثاني". ثم اضغط **حفظ**. من نوع **Terminal**: من نوع المحطة الطرفية: من القائمة ، اضغط **الإعدادات ...** من اللوحة ، انقر فوق **متقدم** واستخدم أشرطة التمرير لتخصيص 60-70٪ من الذاكرة المتوفرة واستخدام نصف جميع وحدات المعالجة المركزية المتاحة. Git Git: https://git-scm.com/downloads Git: https://sourceforge.net/projects/git-osx-installer/files/ انتقل إلى قائمة **Repository** ، ثم انقر فوق **Create Desktop Icon**. هذا سيسمح لك بالعودة إلى هذا التطبيق بسهولة في المستقبل. توصيات الأجهزة مرحبًا WebODM! إذا سار كل شيء على ما يرام ، يجب أن يكون لديك الآن عقدتان للمعالجة! ستتمكن من معالجة مهام متعددة بالتوازي باستخدام جهازين مختلفين. إذا حصلت بدلاً من ذلك على شيء مشابه لما يلي إذا نجح التنزيل ، فمن المفترض أن ترى هذه النافذة الآن: إذا كانت النتيجة هي *kern.hv_support: 0* ، فهذا يعني للأسف أن جهاز Mac قديم جدًا بحيث لا يمكنه تشغيل OpenDroneMap. :( إذا كانت النتيجة *kern.hv_support: 1* ، فهذا يعني أن جهاز Mac الخاص بك مدعوم! تابع مع الخطوة 2. إذا تم تعطيل المحاكاة الافتراضية ، فستحتاج إلى تمكينها. للأسف ، يختلف الإجراء قليلاً بالنسبة لكل طراز كمبيوتر ، لذا فإن أفضل طريقة للقيام بذلك هي البحث في محرك بحث "كيفية تمكين vtx لـ <اكتب طراز الكمبيوتر الخاص بك هنا>". غالبًا ما يكون الأمر يتعلق بإعادة تشغيل الكمبيوتر ، والضغط على الفور على F2 أو F12 أثناء بدء التشغيل ، والتنقل في قائمة التمهيد وتغيير الإعدادات لتمكين التمثيل الافتراضي (غالبًا ما يسمى "VT-X") إذا كنت تستخدم Windows 10 Professional أو إصدارًا أحدث ، فيجب عليك التثبيت بدلاً من ذلك: إذا كنت تستخدم Docker Toolbox ، فابحث عن عنوان IP للاتصال به عن طريق كتابة: إذا كنت تستخدم Docker لنظام التشغيل Windows ، فافتح متصفح الويب على http: // localhost: 8000 إذا حصلت على "bash: git: command not found" ، فحاول إعادة تشغيل تطبيق **Terminal** وتحقق جيدًا من أي أخطاء أثناء عملية التثبيت. إذا قمت بتثبيت Docker Toolbox (انظر أدناه إذا قمت بتثبيت Docker لنظام Windows بدلاً من ذلك): إذا قمت بتثبيت Docker لنظام Windows بدلاً من ذلك: إذا وصلت إلى هذا الحد ، تهانينا! حان الوقت الآن لبدء معالجة بعض البيانات. ي ** موقع المصدر ** ، اكتب: https://github.com/OpenDroneMap/WebODM في ** Target Directory ** انقر فوق تصفح وانتقل إلى مجلد من اختيارك (قم بإنشاء مجلد إذا لزم الأمر) بالإضافة إلى البرامج الثلاثة أعلاه ، هناك حاجة أيضًا إلى البرنامج النصي المكون من docker. في بعض الأحيان يتم تثبيته بالفعل مع عامل الميناء ، ولكن في بعض الأحيان لم يتم تثبيته. للتحقق مما إذا كان مثبتًا ، حاول الكتابة: التثبيت على Arch التثبيت على CentOS / RHEL التثبيت على Fedora التثبيت على Ubuntu / Debian التركيب التثبيت والبدء أحدث جيل من وحدة المعالجة المركزية Linux ابحث في علبة النظام وانقر بزر الماوس الأيمن على أيقونة "الحوت الأبيض". يمكن لمعظم أجهزة الكمبيوتر الحديثة Mac (التي تعمل بعد عام 2010) التي تعمل بنظام macOS Sierra 10.12 أو أعلى تشغيل OpenDroneMap باستخدام عامل الإرساء ، طالما أن دعم الأجهزة الافتراضية (انظر أدناه). لا يمكن معالجة أكثر من 100-200 صورة بالمواصفات المذكورة أعلاه (ستنفد ذاكرة البرنامج). المتطلبات الموصى بها هي: لاحظ أنه تحت قائمة **Processing Nodes** ، تم بالفعل تكوين عقدة "node-odm-1" لتتمكن من استخدامها. هذه عقدة NodeODM وتم إنشاؤها تلقائيًا بواسطة WebODM. تعمل هذه العقدة على نفس جهاز WebODM. تتوفر ODM و NodeODM و WebODM على جميع المنصات الرئيسية (Windows و macOS و Linux) عبر برنامج يسمى docker ، وهو مطلوب لتشغيل البرنامج. تقدم شركة Docker طريقة لتشغيل "الحاويات". الحاويات عبارة عن نُسخ مُعبّأة من نظام برمته وبرامجه وتبعياته. تعمل هذه الحاويات في بيئة افتراضية. تتوفر بيئة افتراضية على Linux من نظام التشغيل وهي فعالة للغاية. في نظامي التشغيل macOS و Windows ، يتم تشغيل الحاويات داخل جهاز ظاهري ، لذلك هناك القليل من النفقات العامة. لكنها لا تزال مناسبة جدًا لتشغيل البرنامج. بمجرد تثبيت المستخدمين ، لا داعي للقلق كثيرًا بشأن عامل الميناء ، لأنه يعمل (تقريبًا) بشفافية. في Ubuntu Linux 18.04 ، من الممكن تشغيل جميع برامج OpenDroneMap أصلاً. ومع ذلك ، نظرًا لوجود القليل جدًا من عقوبة الأداء لتشغيل عامل الميناء على Linux ووصلة عامل الميناء مباشرة على الإعداد على هذا النظام الأساسي ، فإننا لا نوصي بذلك. في لينكس ، تفوق مزايا الحاويات بشكل كبير عقوبة الأداء الصغيرة. مع مستخدمي docker ، يحصلون أيضًا على تحديثات سهلة لخطوة واحدة للبرنامج ، وهذا أمر جيد. في نظام التشغيل Windows 7 لمعرفة ما إذا تم تمكين المحاكاة الافتراضية ، يمكنك استخدام أداة الكشف عن المحاكاة الافتراضية المدعومة بالأجهزة من Microsoft® <http:// www.microsoft.com/en-us/download/details.aspx?id=592>`_ في حين أن. افتح نافذة طرفية واكتب: افتح برنامج ** Git Gui ** الذي يأتي مثبتًا مع Git. من هناك: افتح تطبيق ** VirtualBox Manager ** يمكن تشغيل OpenDroneMap على أي توزيع Linux يدعم عامل الإرساء. `وفقًا لموقع وثائق docker على الويب <https://docs.docker.com/install/>`_ التوزيعات المدعومة رسميًا هي CentOS و Debian و Ubuntu و Fedora ، مع ثنائيات ثابتة متاحة للآخرين. إذا كان عليك اختيار توزيع فقط لتشغيل OpenDroneMap ، فإن Ubuntu هو الطريقة الموصى بها للذهاب. يتم سرد أوامر مفيدة أخرى أدناه: Pip أرجوك** لا** تثبيت كل من برامج عامل الميناء. إنهما مختلفان وسيحدثان فوضى إذا تم تثبيتهما اضغط **التقديم وإعادة التشغيل** اضغط **تطبيق**. اضغط ** استنساخ ** Python (2 or 3) Python (latest version 3): https://www.python.org/downloads/windows/ نقر بزر الماوس الأيمن على ** الافتراضي ** VM واضغط على ** إغلاق (إيقاف تشغيل ACPI) ** لإيقاف الجهاز انقر بزر الماوس الأيمن على ** افتراضي ** VM واضغط على ** الإعدادات ... ** انقر بزر الماوس الأيمن على رمز الحوت من شريط المهام وانقر على** التفضيلات** ... يعمل على أكثر من جهاز حدد علامة التبويب** متقدم** سيتم تنزيل العديد من المكونات على جهازك في هذه المرحلة ، بما في ذلك WebODM و NodeODM و ODM. بعد التنزيل ، يجب أن تستقبل الشاشة التالية: الخطوة 1. تحقق من دعم المحاكاة الافتراضية الخطوة 1. تثبيت المتطلبات الخطوة 2. تحقق من المتطلبات الإضافية الخطوة 2. تثبيت المتطلبات الخطوة 3. تحقق من تخصيص الذاكرة ووحدة المعالجة المركزية الخطوة 3. قم بتحميل وتشغيل WebODM الخطوة 4. قم بتنزيل WebODM الخطوة 4. قم بتحميل وتشغيل WebODM الخطوة 4. قم بتشغيل WebODM يطلب الأمر أعلاه من docker تشغيل حاوية جديدة باستخدام صورة opendronemap / nodeodm من Docker Hub (أحدث إصدار من NodeODM) ، باستخدام المنفذ 3000 ، وتعيين الحد الأقصى لعدد المهام المتزامنة إلى 1 وحماية العقدة من الوصول غير المصرح به باستخدام كلمة السر "سرية". سيسمح ما سبق بمعالجة بضع مئات من الصور دون مشاكل كثيرة. ستسمح وحدة المعالجة المركزية (CPU) المزودة بمزيد من النوى بمعالجة أسرع ، بينما لا تؤثر بطاقة الرسومات (GPU) حاليًا على الأداء. لمعالجة المزيد من الصور ، أضف المزيد من مساحة القرص وذاكرة الوصول العشوائي خطيًا إلى عدد الصور التي تحتاج إلى معالجتها. الحد الأدنى من المتطلبات لتشغيل البرنامج هي: الشيء الرائع في استخدام عامل الإرساء هو أن 99٪ من المهام التي ستحتاج إلى تنفيذها أثناء استخدام WebODM يمكن إجراؤها عبر النص البرمجي .webodm.sh/. لقد واجهت بالفعل أحدهم: ثم اتصل بـ http://192.168.1.100:8000 (استبدال عنوان IP بالعنوان المناسب). ثم افتح متصفح الويب على http://localhost:8000. ثم اضغط على **OK** ، انقر بزر الماوس الأيمن على **default **VM واضغط على **Start**. بعد ذلك ، فقط إذا كنت تستخدم Windows 10 Home أو Windows 8 (أي إصدار) أو Windows 7 (أي إصدار) ، قم بتثبيت: هناك أربعة برامج تحتاج للتثبيت: يوجد برنامجان فقط للتثبيت: هناك العديد من الأوامر الأخرى التي يمكنك استخدامها ، بالإضافة إلى إشارات مختلفة. العلامات هي معلمات يتم تمريرها إلى الأمر. / webodm.sh وعادة ما تكون مسبوقة بـ "-". ترشد علامة **port** على سبيل المثال WebODM إلى استخدام منفذ شبكة مختلف: تم اقتباس هذا القسم وتعديله بإذن من  `OpenDroneMap: الدليل المفقود <https://odmbook.com>`_, by Piero Toffanin. لتشغيل OpenDroneMap ، تحتاج إلى Windows 7. على الأقل. الإصدارات السابقة من Windows غير مدعومة. للتحقق من تثبيت git ، اكتب ببساطة: حتى وقت قريب كان OpenDroneMap هو المصطلح المستخدم للإشارة إلى تطبيق سطر أوامر واحد (ما يعرف الآن بمشروع ODM). مع التطور الأخير لواجهة الويب وواجهة برمجة التطبيقات والأدوات الأخرى ، أصبحت OpenDroneMap نظامًا إيكولوجيًا من التطبيقات المختلفة لمعالجة البيانات الجوية وتحليلها وعرضها. يتكون هذا النظام البيئي من عدة مكونات: لا يمكننا تغطية عملية التثبيت لكل توزيع Linux هناك ، لذلك سنقصر التعليمات على التوزيعات التي تدعمها شركة docker رسميًا. في جميع الحالات ، يكون الأمر مجرد فتح موجه طرفية وكتابة بعض الأوامر. نوصي باستخدام الناس `docker <https://www.docker.com>`_ أو تشغيل ODM ، سواء كنت تستخدم نظام التشغيل Windows أو macOS أو Linux. عندما يفتح Git Gui ، انقر فوق خيار "Clone Existing Repository" الذي يجب أن يعود والتي يجب أن تُرجع شيئًا مشابهًا لما يلي: Windows بدون عامل إرساء ، لن يكون من الممكن تشغيل ODM على Windows أو macOS. لا يمكن تشغيل ODM على هذه الأنظمة الأساسية بشكل أصلي. يتم تركيز جهود التطوير المستقبلية على الاستفادة من نظام Windows الفرعي الجديد لنظام Linux (WSL) وإمكانية جعل المنفذ الأصلي لجميع التبعيات إلى macOS ، الأمر الذي سيجعل التثبيت أسهل بكثير. يمكنك التحقق من أن عامل الميناء يعمل بشكل صحيح من خلال فتح تطبيق **Terminal** وكتابة: يجب أن تحصل على نتيجة مثل ما يلي: يجب أن تشاهد أشياء مشابهة لما يلي: ستحصل على رد مشابه لما يلي:  <https://community.opendronemap.org>`_ مكان رائع لطلب المساعدة إذا واجهتك مشكلة أثناء أي من خطوات التثبيت وللأسئلة` العامة حول استخدام البرنامج النصي .webodm.sh/. macOS الذي يعتني ببدء WebODM وإعداد عقدة معالجة افتراضية (node-odm-1). إذا كنت تريد إيقاف WebODM ، يمكنك بالفعل تخمين ما هو الأمر: يمكنك تثبيته باستخدام pip: 