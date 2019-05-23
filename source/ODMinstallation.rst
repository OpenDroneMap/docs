.. Notes and doc on installing ODM

ODM Installation
================


Hardware Recommendations
------------------------

OpenDroneMap is built on Ubuntu 16.04 but can be run on other major platforms using Docker.

Minimum 4GB of RAM, recommended 16GB or more. Many parts of the ODM toolchain are parallelized, and memory requirements will increase as the size of the input data increases.

.. _docker-installation:

Docker Installation (cross-platform)
------------------------------------

We recommend people use `docker <https://www.docker.com>`_ for running ODM, whether you are on Windows, macOS or Linux.

Install Docker on Windows
`````````````````````````

Before you start, check that your CPU supports virtualization! Sometimes this is disabled from the BIOS. The feature is often called "VT-X" and needs to be enabled. On Windows 8 or higher you can check if virtualization is enabled by opening the Task Manager --> Performance tab. The "Virtualization" field of your CPU should read "enabled". On Windows 7 you can use `this tool <http://www.microsoft.com/en-us/download/details.aspx?id=592>`_ instead.

Now we can install docker:

 * If you are on Windows 10 Home, Windows 8 (any version) or Windows 7 (any version), use Docker Toolbox: https://github.com/docker/toolbox/releases/download/v18.09.3/DockerToolbox-18.09.3.exe
 * If you are on Windows 10 Professional or a newer version use Docker for Windows instead: https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe 

Install Docker on macOS/Linux
`````````````````````````````

Docker installation on macOS and Linux is straightforward. 

 * For macOS simply download the Docker for Mac installer from https://download.docker.com/mac/stable/Docker.dmg  
 * For Linux simply use the the docker install script::

    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh

Running ODM/WebODM
``````````````````

With docker installed, see the :ref:`docker-usage` usage page on using ODM.

Before running ODM it's advised to check that Docker is allocating sufficient resources to containers. In Windows this can be done in the 'Docker for Windows' program under the 'Advanced' tab.

ODM is a command line utility. We also have a graphical interface called `WebODM <https://github.com/OpenDroneMap/WebODM>`_. To install it, make sure you have installed `git <https://git-scm.com/downloads/>`_ and `python <https://www.python.org/downloads/>`_. Then launch a shell (macOS/Linux) or ``Git Bash`` (Windows) from the start menu (**not** a command prompt/powershell) and simply type::

    git clone https://github.com/OpenDroneMap/WebODM  --config core.autocrlf=input --depth 1
    cd WebODM/
    ./webodm.sh start

See the `WebODM project README <https://github.com/OpenDroneMap/WebODM>`_ for other useful commands.


Build your docker image
```````````````````````

Download and extract the latest version of ODM: https://github.com/OpenDroneMap/ODM/archive/master.zip

In Docker toolbox or Docker CE, navigate to your extracted ODM directory. Then build the Docker image.::

    cd Documents/OpenDroneMap_v0_3_1/
    docker build -t my_odm_image .

When building your own Docker image, if image size is of importance to you, you should use the ``--squash`` flag, like so:::

    docker build --squash -t my_odm_image .

This will clean up intermediate steps in the Docker build process, resulting in a significantly smaller image (about half the size).

Experimental flags need to be enabled in Docker to use the ``--squash`` flag. To enable this, insert the following into the file /etc/docker/daemon.json:::

    {
        "experimental": true
    }

After this, you must restart docker by typing ``sudo service docker restart`` into your Linux terminal.



Once this is done, go to :ref:`docker-usage`


.. _native-installation:

Native Installation (Ubuntu 16.04)
----------------------------------

Download and extract the latest version of ODM: https://github.com/OpenDroneMap/ODM/archive/master.zip

The installation is simple::

    bash configure.sh install


configure.sh can take up to 2 arguments

configure.sh command [n]
    command: can be one of (install, reinstall, uninstall, usage)

    [n] is an optional argument that will set the number of processes for the compiler


Setting environment variables
`````````````````````````````

Using your favorite editor, open `~/.bashrc` and append the following to the bottom of the file (replace /your/path/OpenDroneMap with your installation path, e.g. /home/user/OpenDroneMap)::

    export PYTHONPATH=$PYTHONPATH:/your/path/OpenDroneMap/SuperBuild/install/lib/python2.7/dist-packages
    export PYTHONPATH=$PYTHONPATH:/your/path/OpenDroneMap/SuperBuild/src/opensfm
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/your/path/OpenDroneMap/SuperBuild/install/lib

You will need to log out and back in again for the variables to set.

