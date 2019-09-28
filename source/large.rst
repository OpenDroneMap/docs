.. large

Splitting Large Datasets
========================

Starting with ODM version ``0.6.0`` you can split up very large datasets into manageable chunks (called submodels), running the pipeline on each chunk, and then producing merged DEMs, orthophotos and point clouds. The process is referred to as "split-merge".

Why might you use the split-merge pipeline? If you have a very large number of images in your dataset, split-merge will help make the processing more manageable on a large machine (it will require less memory). If you have many machines all connected to the same network you can also process the submodels in parallel, thus allowing for horizontal scaling and processing thousands of images more quickly.

Split-merge works in WebODM out of the box as long as the processing nodes support split-merge, by enabling the ``--split`` option when creating a new task.

Calibrate images
----------------

Image calibration is recommended (but not required) for large datasets because error propagation due to image distortion could cause a bowl effect on the models. Calibration instructions can be found at 	`Calibrate Images <tutorials.html#calibrating-the-camera>`_.

.. figure:: images/msimbasi_bowling.png
   :alt: image of lens distortion effect on bowling of data
   :align: center

Bowling effect on point cloud over 13,000+ image dataset collected by World Bank Tanzania over the flood prone Msimbasi Basin, Dar es Salaam, Tanzania.

Local Split-Merge
-----------------

Splitting a dataset into more manageable submodels and sequentially processing all submodels on the same machine is easy! Just use ``--split`` and ``--split-overlap`` to decide the the average number of images per submodels and the overlap (in meters) between submodels respectively

.. code:: bash

    docker run -ti --rm -v /my/project:/datasets/code opendronemap/odm --project-path /datasets --split 400 --split-overlap 100

If you already know how you want to split the dataset, you can provide that information and it will be used instead of the clustering algorithm.

The grouping can be provided by adding a file named image_groups.txt in the main dataset folder. The file should have one line per image. Each line should have two words: first the name of the image and second the name of the group it belongs to. For example::

    01.jpg A
    02.jpg A
    03.jpg B
    04.jpg B
    05.jpg C

will create 3 submodels. Make sure to pass ``--split-overlap 0`` if you manually provide a ``image_groups.txt`` file.


Distributed Split-Merge
-----------------------

ODM can also automatically distribute the processing of each submodel to multiple machines via `NodeODM <https://github.com/OpenDroneMap/NodeODM>`_ nodes, orchestrated via `ClusterODM <https://github.com/OpenDroneMap/ClusterODM>`_.

.. figure:: images/clusterodm.png
   :alt: image of lens distortion effect on bowling of data
   :align: center

Getting Started with Distributed Split-Merge
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The first step is start ClusterODM

.. code:: bash

    docker run -ti -p 3001:3000 -p 8080:8080 opendronemap/clusterodm

Then on each machine you want to use for processing, launch a NodeODM instance via

.. code:: bash

    docker run -ti -p 3000:3000 opendronemap/nodeodm

Connect via telnet to ClusterODM and add the IP addresses/port of the machines running NodeODM

.. code:: bash

    $ telnet <cluster-odm-ip> 8080
    Connected to <cluster-odm-ip>.
    Escape character is '^]'.
    [...]
    # node add <node-odm-ip-1> 3000
    # node add <node-odm-ip-2> 3000
    [...]
    # node list
    1) <node-odm-ip-1>:3000 [online] [0/2] <version 1.5.1>
    2) <node-odm-ip-2>:3000 [online] [0/2] <version 1.5.1>

Make sure you are running version ``1.5.1`` or higher of the NodeODM API.

At this point, simply use the ``--sm-cluster`` option to enable distributed split-merge

.. code:: bash

    docker run -ti --rm -v /my/project:/datasets/code opendronemap/odm --project-path /datasets --split 800 --split-overlap 120 --sm-cluster http://<cluster-odm-ip>:3001

Understanding the Cluster
^^^^^^^^^^^^^^^^^^^^^^^^^

When connected via telnet, it is possible to interrogate what is happening on the cluster. For example, we can use the command HELP to find out available commands

.. code:: bash

	# HELP
	NODE ADD <hostname> <port> [token] - Add new node
	NODE DEL <node number> - Remove a node
	NODE INFO <node number> - View node info
	NODE LIST - List nodes
	NODE LOCK <node number> - Stop forwarding tasks to this node
	NODE UNLOCK <node number> - Resume forwarding tasks to this node
	NODE UPDATE - Update all nodes info
	NODE BEST <number of images> - Show best node for the number of images
	ROUTE INFO <taskId> - Find route information for task
	ROUTE LIST [node number] - List routes
	TASK LIST [node number] - List tasks
	TASK INFO <taskId> - View task info
	TASK OUTPUT <taskId> [lines] - View task output
	TASK CANCEL <taskId> - Cancel task
	TASK REMOVE <taskId> - Remove task
	ASR VIEWCMD <number of images> - View command used to create a machine
	!! - Repeat last command

If, for example, the NodeODM instance wasn't active when ClusterODM started, we might list nodes and see something as follows

.. code:: bash

	# NODE LIST
	1) localhost:3000 [offline] [0/2] <version 1.5.3> [L]

To address this, we can start up our local node (if not already started), and then perform a ``NODE UPDATE``

.. code:: bash

	# NODE UPDATE
	OK
	# NODE LIST
	1) localhost:3000 [online] [0/2] <version 1.5.3> [L]

Accessing the Logs
^^^^^^^^^^^^^^^^^^

While a process is running, it is also possible to list the tasks, and view the task output

.. code:: bash

	# TASK LIST
	# TASK OUTPUT <taskId> [lines]

Autoscaling ClusterODM
^^^^^^^^^^^^^^^^^^^^^^

ClusterODM also includes the option to autoscale on multiple platforms, including, to date, Amazon and Digital Ocean. This allows users to reduce costs associated with always-on instances as well as being able to scale processing based on demand.

To setup autoscaling you must:

* Have a functioning version of NodeJS installed and then install ClusterODM

.. code:: bash

	git clone https://github.com/OpenDroneMap/ClusterODM
	cd ClusterODM
	npm install

* Make sure docker-machine is installed.
* Setup a S3-compatible bucket for storing results.
* Create a configuration file for `DigitalOcean <https://github.com/OpenDroneMap/ClusterODM/blob/master/docs/digitalocean.md>`_ or `Amazon Web Services <https://github.com/OpenDroneMap/ClusterODM/blob/master/docs/aws.md>`_.

You can then launch ClusterODM with

.. code:: bash

	node index.js --asr configuration.json

You should see something similar to following messages in the console

.. code:: bash

	info: ASR: DigitalOceanAsrProvider
	info: Can write to S3
	info: Found docker-machine executable

You should always have at least one static NodeODM node attached to ClusterODM, even if you plan to use the autoscaler for all processing. If you setup auto scaling, you can't have zero nodes and rely 100% on the autoscaler. You need to attach a NodeODM node to act as the "reference node" otherwise ClusterODM will not know how to handle certain requests (for the forwarding the UI, for validating options prior to spinning up an instance, etc.). For this purpose, you should add a "dummy" NodeODM node and lock it

.. code:: bash

	telnet localhost 8080
	> NODE ADD localhost 3001
	> NODE LOCK 1
	> NODE LIST
	1) localhost:3001 [online] [0/2] <version 1.5.1> [L]

This way all tasks will be automatically forwarded to the autoscaler.

Limitations
-----------

The 3D textured meshes are currently not being merged as part of the workflow (only point clouds, DEMs and orthophotos are).

GCPs are fully supported, however, there needs to be at least 3 GCP points on each submodel for the georeferencing to take place. If a submodel has fewer than 3 GCPs, a combination of the remaining GCPs + EXIF data will be used instead (which is going to be less accurate). We recommend using the ``image_groups.txt`` file to accurately control the submodel split when using GCPs.

Acknowledgments
---------------
Huge props to Pau and the folks at Mapillary for their amazing contributions to OpenDroneMap through their OpenSfM code, which is a key component of the split-merge pipeline. We look forward to further pushing the limits of OpenDroneMap and seeing how big a dataset we can process.

`Help edit these docs! <https://github.com/OpenDroneMap/docs/blob/publish/source/large.rst>`_
