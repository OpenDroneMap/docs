.. large

Splitting Large Datasets
========================

Starting with ODM version ``0.6.0`` you can split up very large datasets into manageable chunks (called submodels), running the pipeline on each chunk, and then producing merged DEMs, orthophotos and point clouds. The process is referred to as "split-merge".

Why might you use the split-merge pipeline? If you have a very large number of images in your dataset, split-merge will help make the processing more manageable on a large machine (it will require less memory). If you have many machines all connected to the same network you can also process the submodels in parallel, thus allowing for horizontal scaling and processing thousands of images more quickly.

Split-merge works in WebODM out of the box as long as the processing nodes support split-merge, by enabling the ``--split`` option when creating a new task.

Calibrate images
----------------

Image calibration is recommended (but not required) for large datasets because error propagation due to image distortion could cause a bowl effect on the models. Calibration instructions can be found at :ref:`calibration`.

Local Split-Merge
-----------------

Splitting a dataset into more manageable submodels and sequentially processing all submodels on the same machine is easy! Just use ``--split`` and ``--split-overlap`` to decide the the average number of images per submodels and the overlap (in meters) between submodels respectively::

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

The first step is start ClusterODM::

    docker run -ti -p 3001:3000 -p 8080:8080 opendronemap/clusterodm

Then on each machine you want to use for processing, launch a NodeODM instance via::

    docker run -ti -p 3000:3000 opendronemap/nodeodm

Connect via telnet to ClusterODM and add the IP addresses/port of the machines running NodeODM::

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

At this point, simply use the ``--sm-cluster`` option to enable distributed split-merge::

    docker run -ti --rm -v /my/project:/datasets/code opendronemap/odm --project-path /datasets --split 400 --split-overlap 100 --sm-cluster http://<cluster-odm-ip>:3001

Limitations
-----------

The 3D textured meshes are currently not being merged as part of the workflow (only point clouds, DEMs and orthophotos are).

GCPs are fully supported, however, there needs to be at least 3 GCP points on each submodel for the georeferencing to take place. If a submodel has less than 3 GCPs, a combination of the remaining GCPs + EXIF data will be used instead (which is going to be less accurate). We recommend using the ``image_groups.txt`` file to accurately control the submodel split when using GCPs.

Aknowledgments
--------------
Huge props to Pau and the folks at Mapillary for their amazing contributions to OpenDroneMap through their OpenSfM code, which is a key component of the split-merge pipeline. We look forward to further pushing the limits of OpenDroneMap and seeing how big a dataset we can process.
