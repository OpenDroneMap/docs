.. Notes and doc on installing ODM

Installation and Getting Started
================================

This section is excerpted and modified with permission from `OpenDroneMap: The Missing Guide <https://odmbook.com>`_, by Piero Toffanin.

Quickstart
----------

Installers for OpenDroneMap are available for purchase, and are the easiest way to get started and come with support.

https://opendronemap.org/webodm/download/#installer

That said, OpenDroneMap is a free and open source ecoystem. Community support is available for those looking to install themselves and directions follow:

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


.. _docker-installation:

Installation
------------

We recommend people use `docker <https://www.docker.com>`_ for running ODM, whether you are on Windows, macOS or Linux.

Windows
```````

To run OpenDroneMap you need at least Windows 7. Previous
versions of Windows are not supported.

Step 1. Check Virtualization Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Docker requires a feature from your CPU called virtualization, which allows it to run virtual machines (VMs). Make sure you have it enabled! Sometimes this is disabled. To check, on Windows 8 or higher you can open the **Task Manager** (press CTRL+SHIFT+ESC) and switch to the **Performance** tab.

.. figure:: images/virtualizationcheck.webp
   :alt: Image of checking virtualization in Windows 8 or higher
   :align: center

*Virtualization should be enabled*

On Windows 7 to see if you have virtualization enabled you can use the `Microsoft® Hardware-Assisted Virtualization Detection Tool <http://
www.microsoft.com/en-us/download/details.aspx?id=592>`_ instead.

If virtualization is disabled, you’ll need to enable it. The procedure unfortunately is a bit different for each computer model, so the best way to do this is to look up on a search engine “how to enable vtx for <type your computer model here>”. Often times it’s a matter of restarting the computer, immediately pressing F2 or F12 during startup, navigating the boot menu and changing the settings to enable virtualization (often called “VT-X”).

.. figure:: images/bioskeys.webp
   :alt: Table of different bios keys
   :align: center

*Common keys to press at computer startup to access the boot menu for various PC vendors*

Step 2. Install Requirements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, you’ll need to install:

* Git: https://git-scm.com/downloads
* Python (latest version 3): https://www.python.org/downloads/windows/

For Python 3, make sure you check **Add Python 3.x to PATH** during the installation.

.. figure:: images/installpython3.webp
   :alt: Screenshot of Python3 installation process
   :align: center

*Don’t forget to add the Python executable to your PATH (so that you can run commands with it)*

Then, only if you are on Windows 10 Home, Windows 8 (any version) or Windows 7 (any version), install:

* Docker Toolbox: https://github.com/docker/toolbox/releases/download/v18.09.3/DockerToolbox-18.09.3.exe

If you are on Windows 10 Professional or a newer version, you should install instead:

* Docker for Windows:https://docs.docker.com/desktop/install/windows-install/

Please do **NOT** install both docker programs. They are different and will create a mess if they are both installed.

After installing docker, launch it from the Desktop icon that is created from the installation (**Docker Quickstart** in the case of Docker Toolbox, **Docker for Windows** for Docker for Windows). This is important, do not skip this step. If there are errors, follow the prompts on screen to fix them.

Step 3. Check Memory and CPU Allocation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Docker on Windows works by running a VM in the background (think of a VM as a “computer emulator”). This VM has a certain amount of memory allocated and WebODM can only use as much memory as it’s allocated.

If you installed Docker Toolbox (see below if you installed Docker for Windows instead):

1. Open the **VirtualBox Manager** application
2. Right click the **default** VM and press **Close (ACPI Shutdown)** to stop the machine
3. Right click the **default** VM and press **Settings...**
4. Move the **Base Memory** slider from the **System** panel and allocate 60-70% of all available memory, optionally adding 50% of the available processors from the **Processor** tab also

.. figure:: images/virtualboxsettings.webp
   :alt: Screenshot of VirtualBox Settings
   :align: center

*VirtualBox default VM settings*

Then press **OK**, right click the **default** VM and press **Start**.

If you installed Docker for Windows instead:

1. Look in the system tray and right click the “white whale” icon.
2. From the menu, press **Settings...**
3. From the panel, click **Advanced** and use the sliders to allocate 60-70% of available memory and use half of all available CPUs.
4. Press **Apply**.

.. figure:: images/dockericon.webp
   :alt: Screenshot of Docker Icon
   :align: center

*Step 1 Docker icon*

.. figure:: images/dockersettings.webp
   :alt: Screenshot of Docker Settings
   :align: center

*Step 3 & 4 Docker settings*

Step 4. Download WebODM
^^^^^^^^^^^^^^^^^^^^^^^

Open the **Git Gui** program that comes installed with Git. From there:

* When Git Gui opens, click 'Clone Existing Repository' option
* In **Source Location** type: https://github.com/OpenDroneMap/WebODM
* In **Target Directory** click browse and navigate to a folder of your choosing (create one if necessary)
* Press **Clone**

.. figure:: images/gitgui.webp
   :alt: Screenshot of Git Gui
   :align: center

*Git Gui*

If the download succeeded, you should now see this window:

.. figure:: images/gitguisuccess.webp
   :alt: Screenshot of Git Gui after successful download
   :align: center

*Git Gui after successful download (clone)*

Go to the **Repository** menu, then click **Create Desktop Icon**. This will allow you to come back to this application easily in the future.

Step 4. Launch WebODM
^^^^^^^^^^^^^^^^^^^^^

From Git Gui, go to the **Repository** menu, then click **Git Bash**. From the command line terminal type:

.. code:: bash

	$ ./webodm.sh start &
	
Several components will download to your machine at this point, including WebODM, NodeODM and ODM. After the download you should be greeted by the following screen:

.. figure:: images/webodmsuccess.webp
   :alt: Screenshot of after successfully downloading WebODM
   :align: center

*Console output after starting WebODM for the first time*

* If you are using Docker for Windows, open a web browser to http://localhost:8000
* If you are using Docker Toolbox, find the IP address to connect to by typing:

.. code:: bash

	$ docker-machine ip

You should get a result like the following:

.. code:: bash

	192.168.1.100
	
Then connect to http://192.168.1.100:8000 (replacing the IP address with the proper one).

macOS
`````

Most modern (post 2010) Mac computers running macOS Sierra 10.12 or higher can run OpenDroneMap using docker, as long as hardware virtualization is supported (see below).

Step 1. Check Virtualization Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Open a Terminal window and type:

.. code:: bash

	$ sysctl kern.hv_support

You will get a response similar to the following:

.. code:: bash

	kern.hv_support: 1

If the result is *kern.hv_support: 1*, then your Mac is supported! Continue with Step 2.

If the result is *kern.hv_support: 0*, unfortunately it means your Mac is too old to run OpenDroneMap. :(

Step 2. Install Requirements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There are only two programs to install:

1. Docker: https://download.docker.com/mac/stable/Docker.dmg
2. Git: https://sourceforge.net/projects/git-osx-installer/files/

After installing docker you should find an icon that looks like a whale in the task bar.

.. figure:: images/macwhale.webp
   :alt: Screenshot of Docker whale
   :align: center

*Docker app running*

You can verify that docker is running properly by opening the **Terminal** app and typing:

.. code:: bash

	$ docker run hello-world
	
Which should return

.. code:: bash

	Hello from Docker!
	
To verify that git is installed, simply type:

.. code:: bash

	$ git --version
	
Which should return something similar to the following:

.. code:: bash

	git version 2.20.1 (Apple Git-117)
	
If you get a “bash: git: command not found”, try to restart your **Terminal** app and double-check for any errors during the install process.

Step 3. Check Memory and CPU Allocation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Docker on macOS works by running a VM in the background (think of it as a “computer emulator”). This VM has a certain amount of memory allocated and WebODM can only use as much memory as it’s allocated.

1. Right click the whale icon from the task bar and click **Preferences**...
2. Select the **Advanced** tab
3. Adjust the CPUs slider to use half of all available CPUs and the memory to use 60-70% of all available memory
4. Press **Apply & Restart**

.. figure:: images/dockeradvanced.webp
   :alt: Screenshot of Docker advanced settings
   :align: center

*Docker advanced settings*

Step 4. Download and Launch WebODM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

From a **Terminal** type:

.. code:: bash

	$ git clone https://github.com/OpenDroneMap/WebODM
	$ cd WebODM
	$ ./webodm.sh start

Then open a web browser to http://localhost:8000.

Linux
`````

OpenDroneMap can run on any Linux distribution that supports docker. According to `docker’s documentation website <https://docs.docker.com/install/>`_ the officially supported distributions are CentOS, Debian, Ubuntu and Fedora, with static binaries available for others. If you have to pick a distribution solely for running OpenDroneMap, Ubuntu is the recommended way to go.

Step 1. Install Requirements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There are four programs that need to be installed:

1. Docker
2. Git
3. Python (2 or 3)
4. Pip

We cannot possibly cover the installation process for every Linux distribution out there, so we’ll limit the instructions to those that are distributions officially supported by docker. In all cases it’s just a matter of opening a terminal prompt and typing a few commands.

Install on Ubuntu / Debian
__________________________

Commands to type:

.. code:: bash

	$ sudo apt update
	$ curl -fsSL https://get.docker.com -o get-docker.sh
	$ sh get-docker.sh
	$ sudo apt install -y git python python-pip

Install on CentOS / RHEL
________________________

Commands to type:

.. code:: bash

	$ curl -fsSL https://get.docker.com -o get-docker.sh
	$ sh get-docker.sh
	$ sudo yum -y install git python python-pip
	
Install on Fedora
_________________

Commands to type:

.. code:: bash

	$ curl -fsSL https://get.docker.com -o get-docker.sh
	$ sh get-docker.sh
	$ sudo dnf install git python python-pip
	
Install on Arch
_______________

Commands to type:

.. code:: bash

	$ sudo pacman -Sy docker git python python-pip

Step 2. Check Additional Requirements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In addition to the three programs above, the docker compose script is also needed. Sometimes it’s already installed with docker, but sometimes it isn’t. To verify if it’s installed try to type:

.. code:: bash

	$ docker compose --version
	
You should see somethings similar to the following:

.. code:: bash

	docker compose version 24.0.5, build ced0996600
	

Step 3a. Download and Launch WebODM with webodm.sh call of docker compose
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

From a terminal type:

.. code:: bash

	$ git clone https://github.com/OpenDroneMap/WebODM
	$ cd WebODM
	$ ./webodm.sh start
	
Then open a web browser to http://localhost:8000.

Step 3b. Alternatively, start via docker compose without webodm.sh
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

copy the following 3 files into a newly created folder:

The ``config-default.json``:

.. code:: json
	
	{
		"instance": "node-OpenDroneMap",
		"odm_path": "/code",
	
		"logger": {
			"level": "info",
			"maxFileSize": 104857600,
			"maxFiles": 10,
			"logDirectory": ""
		},
	
		"port": "auto",
		"deamon": false,
		"parallelQueueProcessing": 8,
		"cleanupTasksAfter": 2880,
		"test": false,
		"testSkipOrthophotos": false,
		"testSkipDems": false,
		"token": "",
		"authorizedIps": [],
		"maxImages": ""
	}

The ``init.sql``:

.. code:: sql

	CREATE EXTENSION postgis_raster;
	SET postgis.gdal_enabled_drivers = 'ENABLE_ALL';

And finally the ``compose.yml``:

.. code:: yaml

	services:
	  webodm-node-odm-1:
	    image: opendronemap/nodeodm:gpu
	    container_name: webodm-node-odm-1
	    ports:
	      - "3000:3000"
	    volumes:
	      - ./config-default.json:/var/www/config-default.json
	    privileged: true
	    restart: unless-stopped
	    deploy:
	      resources:
	        reservations:
	          devices:
	            - driver: nvidia
	              capabilities: [gpu]

	  webapp-odm:
	    image: opendronemap/webodm_webapp
	    container_name: webapp
	    entrypoint: /bin/bash -c "service cron start && chmod +x /webodm/*.sh && /bin/bash -c \"/webodm/wait-for-it.sh -t 0 redis-odm:6379 -- /webodm/start.sh\" && python manage.py migrate"
		restart: always
	    volumes:
	      - ./data/webodm:/webodm/app/media:z
	    ports:
	      - "8000:8000"
	    depends_on:
	      - db-odm
	      - redis-odm
	      - webodm-node-odm-1
	    environment:
	      - WO_BROKER=redis://redis-odm
	      - WO_DEFAULT_NODES=1
	      - WO_HOST=localhost
	      - WO_PORT=8000
	      - WO_MEDIA_DIR=appmedia
	      - WO_DB_DIR=dbdata
	      - WO_SSL=NO
	      - WO_SSL_INSECURE_PORT_REDIRECT=80
	      - WO_DATABASE_HOST=db-odm
	      - WO_DATABASE_NAME=webodm_dev
	      - WO_DATABASE_USER=postgres
	      - WO_DATABASE_PASSWORD=postgres

	  redis-odm:
	    image: redis:alpine
	    container_name: redis-odm
	    restart: always

	  db-odm:
	    image: postgis/postgis:17-3.5-alpine
	    container_name: db-odm
	    restart: always
	    volumes:
	      - ./data/odm-db:/var/lib/postgresql/data
	      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
	    environment:
	      - POSTGRES_USER=postgres
	      - POSTGRES_PASSWORD=postgres
	      - POSTGRES_DB=webodm_dev
	    healthcheck:
	      test: [ "CMD", "pg_isready", "-q", "-d", "webodm_dev", "-U", "postgres"]
	      timeout: 45s
	      interval: 20s
	      retries: 5

	  worker:
	    image: opendronemap/webodm_webapp
	    container_name: worker
	    entrypoint: /bin/bash -c "/webodm/wait-for-it.sh -t 0 redis-odm:6379 -- /webodm/wait-for-it.sh -t 0 webapp-odm:8000 -- /webodm/worker.sh start"
		restart: always
	    volumes:
	      - ./data/webodm:/webodm/app/media:z
	    depends_on:
	      - redis-odm
	      - db-odm
	    environment:
	      - WO_BROKER=redis://redis-odm
	      - WO_DATABASE_HOST=db-odm
	      - WO_DATABASE_NAME=webodm_dev
	      - WO_DATABASE_USER=postgres
	      - WO_DATABASE_PASSWORD=postgres

Finally, start the stack using ``docker compose up -d``.
You can now access WebODM at http://localhost:8000 and the nodeODM at http://localhost:3000.

To view logs of the services use ``docker compose logs``

To shut down the services run ``docker compose down``.


Basic Commands and Troubleshooting
----------------------------------

The cool thing about using docker is that 99% of the tasks you’ll ever need to perform while using WebODM can be done via the ./webodm.sh script. You have already encountered one of them:

.. code:: bash

	$ ./webodm.sh start
	
which takes care of starting WebODM and setting up a default processing node (node-odm-1). If you want to stop WebODM, you can already guess what the command is:

.. code:: bash

	$ ./webodm.sh stop
	
There are several other commands you can use, along with different flags. Flags are parameters passed to the ./webodm.sh command and are typically prefixed with “–”. The **port** flag for example instructs WebODM to use a different network port:

.. code:: bash

	$ ./webodm.sh start --port 80

Other useful commands are listed below:

.. code:: bash

	# Restart WebODM (useful if things get stuck)
	$ ./webodm.sh restart
	
	# Reset the admin user's password if you forget it
	$ ./webodm.sh resetadminpassword newpass
	
	# Update everything to the latest version
	$ ./webodm.sh update
	
	# Store processing results in the specified folder instead of the default location (inside docker)
	$ ./webodm.sh restart --media-dir /path/to/webodm_results

	# See all options
	$ ./webodm.sh --help

`The community forum <https://community.opendronemap.org>`_ is a great place to ask for help if you 	get stuck during any of the installation steps and for general questions on using the ./webodm.sh script.

Hello, WebODM!
--------------

After starting the containers using 3a. or 3b. you can open WebODM in the browser.
This will greet you with a welcome message and will ask to create the first user. Take some time to familiarize yourself with the web interface and explore its various menus.

.. figure:: images/webodmdashboard.webp
   :alt: Screenshot of WebODM Dashboard
   :align: center

*WebODM Dashboard*

Notice that under the **Processing Nodes** menu there’s a "node-odm-1" node already configured for you to use. This is a NodeODM node and has been created automatically by WebODM. This node is running on the same machine as WebODM.

If you’ve made it this far, congratulations! Now it’s time to start processing some data.

.. figure:: images/congratulations.webp
   :alt: Image of celebratory dance
   :align: center

Running on more than one machine
````````````````````````````````

**Optionally:** If you have another computer, you can repeat the installation process (install docker, git, python, etc.) and launch a new NodeODM node by typing from a Terminal/Git Bash window:

.. code:: bash

	docker run --rm -it -p 3000:3000 opendronemap/nodeodm -q 1 --token secret

The above command asks docker to launch a new container using the opendronemap/nodeodm image from Docker Hub (the latest version of NodeODM), using port 3000, setting a maximum number of concurrent tasks to 1 and to protect the node from unauthorized access using the password "secret".

From WebODM you can then press the **Add New** button under **Processing Nodes**. For the **hostname/IP** field type the IP of the second computer. For the **port** field type “3000”. For the **token** field type “secret”. You can also add an optional **label** for your node, such as “second computer”. Then press **Save**.

If everything went well, you should now have two processing nodes! You will be able to process multiple tasks in parallel using two different machines.


`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/installation.rst>`_!
