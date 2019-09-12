.. Usage

Usage
=====

.. _docker-usage:

Docker
------

There are two methods for running with docker. One pulls a pre-built image from the docker hub. This is the most reliable. You can also :ref:`build your own image <docker-installation>`. In either case, the run command is the same, what you will change is the name of the image. For the docker hub image, use ``opendronemap/odm``. For an image you built yourself, use that image name (in our case, ``my_odm_image``).::

    docker run -ti --rm -v /my/project:/datasets/code <my_odm_image> --project-path /datasets

Where /my/project is the path to your project containing an ``images`` folder (/my/project/images). ``-v`` is used to connect folders in the docker container to local folders. See :doc:`outputs` for reference on the project layout.

To pass in custom parameters to the run.py script, simply pass it as arguments to the docker run command. For example::

    docker run -ti --rm -v /my/project:/datasets/code <my_odm_image> --project-path /datasets --resize-to 1800 --dsm

If you want to pass in custom parameters using the settings.yaml file, you can pass it as a -v volume binding::

    docker run -ti --rm -v $(pwd)/settings.yaml:/code/settings.yaml -v /my/project:/datasets/code <my_odm_image> --project-path /datasets --resize-to 1800 --dsm

For more information about Docker, check out their `docs <https://docs.docker.com/>`_.

.. _native-usage:

Native
------


First thing you need to do is set the project path. Edit the ``settings.yaml`` file to add your projects folder::

    # This line is really important to set up properly
    project_path: '' # Example: '/home/user/ODMProjects'

    # The rest of the settings will default to the values set unless you uncomment and change them
    #resize_to: 2400

You must change ``project_path: ''`` to add an absolute path to somewhere on your machine. Whenever you run a new project, it will be saved here.

To use OpenDroneMap run the following command::

    python run.py --images </path/to/images> [arguments] <project-name>

Then sit back, grab a coffee and wait. You only have to specify ``--images </path/to/images>`` on the first run.

.. _Tutorials:

Tutorials
---------

Below you will find instructions for some common use cases.

Creating High Quality Orthophotos
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. figure:: images/orthophoto.png
   :alt: image of OpenDroneMap orthophoto
   :align: center

Without any parameter tweaks, ODM chooses a good compromise between quality, speed and memory usage. If you want to get higher quality results, you need to tweak some parameters:

 * ``--orthophoto-resolution`` is the resolution of the orthophoto in cm/pixel. Decrease this value for a higher resolution result.
 * ``--ignore-gsd`` is a flag that instructs ODM to skip certain memory and speed optimizations that directly affect the orthophoto. Using this flag will increase runtime and memory usage, but will produce sharper results.
 * ``--texturing-nadir-weight`` should be increased to ``29-32`` in urban areas to reconstruct better edges of roofs. It should be decreased to ``0-6`` in grassy / flat areas.
 * ``--texturing-data-term`` should be set to `area` in forest areas.
 * ``--mesh-size`` should be increased to `300000-600000` and `--mesh-octree-depth`` should be increased to `10-11` in urban areas to recreate better buildings / roofs.

Creating Digital Elevation Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By default ODM does not create DEMs. To create a digital terrain model, make sure to pass the ``--dtm`` flag. To create a digital surface model, be sure to pass the ``--dsm`` flag.

.. figure:: images/digitalsurfacemodel.png
   :alt: image of OpenDroneMap derived digital surface model
   :align: center

For DTM generation, a Simple Morphological Filter (smrf) is used to classify points in ground vs. non-ground and only the ground points are used. The ``smrf`` filter can be controlled via several parameters:

 * ``--smrf-scalar`` scaling value. Increase this parameter for terrains with lots of height variation.  
 * ``--smrf-slope`` slope parameter, which is a measure of "slope tolerance". Increase this parameter for terrains with lots of height variation. Should be set to something higher than 0.1 and not higher than 1.2.
 * ``--smrf-threshold`` elevation threshold. Set this parameter to the minimum height (in meters) that you expect non-ground objects to be.
 * ``--smrf-window`` window radius parameter (in meters) that corresponds to the size of the largest feature (building, trees, etc.) to be removed. Should be set to a value higher than 10.

Changing these options can affect the result of DTMs significantly. The best source to read to understand how the parameters affect the output is to read the original paper `An improved simple morphological filter for the terrain classification of airborne LIDAR data <https://www.researchgate.net/publication/258333806_An_Improved_Simple_Morphological_Filter_for_the_Terrain_Classification_of_Airborne_LIDAR_Data>`_ (PDF freely available).

Overall the ``--smrf-threshold`` option has the biggest impact on results.

SMRF is good at avoiding Type I errors (small number of ground points mistakenly classified as non-ground) but only "acceptable" at avoiding Type II errors (large number non-ground points mistakenly classified as ground). This needs to be taken in consideration when generating DTMs that are meant to be used visually, since objects mistaken for ground look like artifacts in the final DTM.

.. figure:: images/smrf.png
   :alt: image of lens distortion effect on bowling of data
   :align: center

Two other important parameters affect DEM generation:

 * ``--dem-resolution`` which sets the output resolution of the DEM raster (cm/pixel)
 * ``--dem-gapfill-steps`` which determines the number of progressive DEM layers to use. For urban scenes increasing this value to `4-5` can help produce better interpolation results in the areas that are left empty by the SMRF filter.

Example of how to generate a DTM::

    docker run -ti --rm -v /my/project:/datasets/code <my_odm_image> --project-path /datasets --dtm --dem-resolution 2 --smrf-threshold 0.4 --smrf-window 24

.. _ground-control-points:

Ground Control Points
^^^^^^^^^^^^^^^^^^^^^

Ground control points are useful for correcting for distortions in the data and referencing the data to know coordinate systems.

	The format of the GCP file is simple.

	 * The header line is a description of a UTM coordinate system, which must be written as a proj4 string. http://spatialreference.org/ is a good resource for finding that information. Please note that currently angular coordinates (like lat/lon) DO NOT work.
	 * Subsequent lines are the X, Y & Z coordinates, your associated pixels and the image filename:

	GCP file format::

	    <proj4 string>
	    <geo_x> <geo_y> <geo_z> <im_x> <im_y> <image_name>
	    ...

	e.g. for the Langley dataset::

	    +proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +no_defs 
	    544256.7 5320919.9 5 3044 2622 IMG_0525.jpg
	    544157.7 5320899.2 5 4193 1552 IMG_0585.jpg
	    544033.4 5320876.0 5 1606 2763 IMG_0690.jpg

	If you supply a GCP file called gcp_list.txt then ODM will automatically detect it. If it has another name you can specify using ``--gcp <path>``. If you have a gcp file and want to do georeferencing with exif instead, then you can specify ``--use-exif``.

	`This post has some information about placing Ground Control Targets before a flight <http://diydrones.com/profiles/blogs/ground-control-points-gcps-for-aerial-photography>`_, but if you already have images, you can find your own points in the images post facto. It's important that you find high-contrast objects that are found in **at least** 3 photos, and that you find a minimum of 5 objects.

	Sharp corners are good picks for GCPs. You should also place/find the GCPs evenly around your survey area.

	The ``gcp_list.txt`` file must be created in the base of your project folder.

	For good results your file should have a minimum of 15 lines after the header (5 points with 3 images to each point).
	
Ground Control Points Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

WebODM has a GCP interface, and example of which can be seen on `the WebODM Demo <http://demo.webodm.org/plugins/posm-gcpi/>`_. To use this one would do the following:

Create a GCP list that only includes gcp name (this is the label that will be seen in the GCP interface), x, y, and z, with a header with a proj4 string of your GCPs (make sure they are in a planar coordinate system, such as UTM. It should look something like this:

::

	+proj=utm +zone=37 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs 
	gcp01 529356.250827686 9251137.5643209 8.465 
	gcp02 530203.125367657 9250140.80991621 15.781
	gcp03 530292.136003818 9250745.02372435 11.977
	gcp04 530203.125367657 9250140.80991621 15.781
	gcp05 530292.136003818 9250745.02372435 11.977

Then one can load this GCP list into the interface, load the images, and place each of the GCPs in the image.

Calibrating the Camera
^^^^^^^^^^^^^^^^^^^^^^

Camera calibration is a special challenge with commodity cameras. Temperature changes, vibrations, focus, and other factors can affect the derived parameters with substantial effects on resulting data. Automatic or self calibration is possible and desirable with drone flights, but depending on the flight pattern, automatic calibration may not remove all distortion from the resulting products. James and Robson (2014) in their paper `Mitigating systematic error in topographic models derived from UAV and ground‐based image networks <https://onlinelibrary.wiley.com/doi/full/10.1002/esp.3609>`_ address how to minimize the distortion from self-calibration.

.. figure:: images/msimbasi_bowling.png
   :alt: image of lens distortion effect on bowling of data
   :align: center

Bowling effect on point cloud over 13,000+ image dataset collected by World Bank Tanzania over the flood prone Msimbasi Basin, Dar es Salaam, Tanzania.

To mitigate this effect, there are a few options but the simplest are as follows: fly two patterns separated by 20°, and rather than having a nadir (straight down pointing) camera, use one that points forward by 5°.

.. figure:: images/flight_lines_20deg.png
   :alt: figure showing camera flight line
   :align: center

From James and Robson (2014), `CC BY 4.0 <https://creativecommons.org/licenses/by/4.0/>`_

As this approach to flying can be take longer than typical flights, a pilot or team can fly a small area using the above approach. OpenDroneMap will generate a calibration file called cameras.json that then can be imported to be used to calibrate another flight that is more efficiently but, from a self calibration perspective, less accurately.

Vertically separated flight lines also improve accuracy, but less so than a camera that is forward facing by 5°.

.. figure:: images/forward_facing.png
   :alt: figure showing effect of vertically separated flight lines and forward facing cameras on improving self calibration
   :align: center

From James and Robson (2014), `CC BY 4.0 <https://creativecommons.org/licenses/by/4.0/>`_

.. _arguments:

Command Line Arguments
----------------------

Arguments::

  -h, --help            show this help message and exit
  --images <path>, -i <path>
                        Path to input images
  --project-path <path>
                        Path to the project folder
  --resize-to <integer>
                        resizes images by the largest side for opensfm. Set to
                        -1 to disable. Default: 2048
  --end-with <string>, -e <string>
                        Can be one of:dataset | split | merge | opensfm | mve
                        | odm_filterpoints | odm_meshing | mvs_texturing |
                        odm_georeferencing | odm_dem | odm_orthophoto
  --rerun <string>, -r <string>
                        Can be one of:dataset | split | merge | opensfm | mve
                        | odm_filterpoints | odm_meshing | mvs_texturing |
                        odm_georeferencing | odm_dem | odm_orthophoto
  --rerun-all           force rerun of all tasks
  --rerun-from <string>
                        Can be one of:dataset | split | merge | opensfm | mve
                        | odm_filterpoints | odm_meshing | mvs_texturing |
                        odm_georeferencing | odm_dem | odm_orthophoto
  --video <string>      Path to the video file to process
  --slam-config <string>
                        Path to config file for orb-slam
  --proj <PROJ4 string>
                        Projection used to transform the model into geographic
                        coordinates
  --min-num-features <integer>
                        Minimum number of features to extract per image. More
                        features leads to better results but slower execution.
                        Default: 8000
  --matcher-neighbors <integer>
                        Number of nearest images to pre-match based on GPS
                        exif data. Set to 0 to skip pre-matching. Neighbors
                        works together with Distance parameter, set both to 0
                        to not use pre-matching. OpenSFM uses both parameters
                        at the same time, Bundler uses only one which has
                        value, prefering the Neighbors parameter. Default: 8
  --matcher-distance <integer>
                        Distance threshold in meters to find pre-matching
                        images based on GPS exif data. Set both matcher-
                        neighbors and this to 0 to skip pre-matching. Default:
                        0
  --use-fixed-camera-params
                        Turn off camera parameter optimization during bundler
  --max-concurrency <positive integer>
                        The maximum number of processes to use in various
                        processes. Peak memory requirement is ~1GB per thread
                        and 2 megapixel image resolution. Default: 4
  --depthmap-resolution <positive float>
                        Controls the density of the point cloud by setting the
                        resolution of the depthmap images. Higher values take
                        longer to compute but produce denser point clouds.
                        Default: 640
  --opensfm-depthmap-min-consistent-views <integer: 2 <= x <= 9>
                        Minimum number of views that should reconstruct a
                        point for it to be valid. Use lower values if your
                        images have less overlap. Lower values result in
                        denser point clouds but with more noise. Default: 3
  --opensfm-depthmap-method <string>
                        Raw depthmap computation algorithm. PATCH_MATCH and
                        PATCH_MATCH_SAMPLE are faster, but might miss some
                        valid points. BRUTE_FORCE takes longer but produces
                        denser reconstructions. Default: PATCH_MATCH
  --opensfm-depthmap-min-patch-sd <positive float>
                        When using PATCH_MATCH or PATCH_MATCH_SAMPLE, controls
                        the standard deviation threshold to include patches.
                        Patches with lower standard deviation are ignored.
                        Default: 1
  --use-hybrid-bundle-adjustment
                        Run local bundle adjustment for every image added to
                        the reconstruction and a global adjustment every 100
                        images. Speeds up reconstruction for very large
                        datasets.
  --mve-confidence <float: 0 <= x <= 1>
                        Discard points that have less than a certain
                        confidence threshold. This only affects dense
                        reconstructions performed with MVE. Higher values
                        discard more points. Default: 0.6
  --use-3dmesh          Use a full 3D mesh to compute the orthophoto instead
                        of a 2.5D mesh. This option is a bit faster and
                        provides similar results in planar areas.
  --skip-3dmodel        Skip generation of a full 3D model. This can save time
                        if you only need 2D results such as orthophotos and
                        DEMs.
  --use-opensfm-dense   Use opensfm to compute dense point cloud alternatively
  --ignore-gsd          Ignore Ground Sampling Distance (GSD). GSD caps the
                        maximum resolution of image outputs and resizes images
                        when necessary, resulting in faster processing and
                        lower memory usage. Since GSD is an estimate,
                        sometimes ignoring it can result in slightly better
                        image output quality.
  --mesh-size <positive integer>
                        The maximum vertex count of the output mesh. Default:
                        100000
  --mesh-octree-depth <positive integer>
                        Oct-tree depth used in the mesh reconstruction,
                        increase to get more vertices, recommended values are
                        8-12. Default: 9
  --mesh-samples <float >= 1.0>
                        Number of points per octree node, recommended and
                        default value: 1.0
  --mesh-point-weight <positive float>
                        This floating point value specifies the importance
                        that interpolation of the point samples is given in
                        the formulation of the screened Poisson equation. The
                        results of the original (unscreened) Poisson
                        Reconstruction can be obtained by setting this value
                        to 0.Default= 4
  --fast-orthophoto     Skips dense reconstruction and 3D model generation. It
                        generates an orthophoto directly from the sparse
                        reconstruction. If you just need an orthophoto and do
                        not need a full 3D model, turn on this option.
                        Experimental.
  --crop <positive float>
                        Automatically crop image outputs by creating a smooth
                        buffer around the dataset boundaries, shrinked by N
                        meters. Use 0 to disable cropping. Default: 3
  --pc-classify         Classify the point cloud outputs using a Simple
                        Morphological Filter. You can control the behavior of
                        this option by tweaking the --dem-* parameters.
                        Default: False
  --pc-csv              Export the georeferenced point cloud in CSV format.
                        Default: False
  --pc-las              Export the georeferenced point cloud in LAS format.
                        Default: False
  --pc-filter <positive float>
                        Filters the point cloud by removing points that
                        deviate more than N standard deviations from the local
                        mean. Set to 0 to disable filtering. Default: 2.5
  --smrf-scalar <positive float>
                        Simple Morphological Filter elevation scalar
                        parameter. Default: 1.25
  --smrf-slope <positive float>
                        Simple Morphological Filter slope parameter (rise over
                        run). Default: 0.15
  --smrf-threshold <positive float>
                        Simple Morphological Filter elevation threshold
                        parameter (meters). Default: 0.5
  --smrf-window <positive float>
                        Simple Morphological Filter window radius parameter
                        (meters). Default: 18.0
  --texturing-data-term <string>
                        Data term: [area, gmi]. Default: gmi
  --texturing-nadir-weight <integer: 0 <= x <= 32>
                        Affects orthophotos only. Higher values result in
                        sharper corners, but can affect color distribution and
                        blurriness. Use lower values for planar areas and
                        higher values for urban areas. The default value works
                        well for most scenarios. Default: 16
  --texturing-outlier-removal-type <string>
                        Type of photometric outlier removal method: [none,
                        gauss_damping, gauss_clamping]. Default:
                        gauss_clamping
  --texturing-skip-visibility-test
                        Skip geometric visibility test. Default: False
  --texturing-skip-global-seam-leveling
                        Skip global seam leveling. Useful for IR data.Default:
                        False
  --texturing-skip-local-seam-leveling
                        Skip local seam blending. Default: False
  --texturing-skip-hole-filling
                        Skip filling of holes in the mesh. Default: False
  --texturing-keep-unseen-faces
                        Keep faces in the mesh that are not seen in any
                        camera. Default: False
  --texturing-tone-mapping <string>
                        Turn on gamma tone mapping or none for no tone
                        mapping. Choices are 'gamma' or 'none'. Default: none
  --gcp <path string>   path to the file containing the ground control points
                        used for georeferencing. Default: None. The file needs
                        to be on the following line format: easting northing
                        height pixelrow pixelcol imagename
  --use-exif            Use this tag if you have a gcp_list.txt but want to
                        use the exif geotags instead
  --dtm                 Use this tag to build a DTM (Digital Terrain Model,
                        ground only) using a simple morphological filter.
                        Check the --dem* and --smrf* parameters for finer
                        tuning.
  --dsm                 Use this tag to build a DSM (Digital Surface Model,
                        ground + objects) using a progressive morphological
                        filter. Check the --dem* parameters for finer tuning.
  --dem-gapfill-steps <positive integer>
                        Number of steps used to fill areas with gaps. Set to 0
                        to disable gap filling. Starting with a radius equal
                        to the output resolution, N different DEMs are
                        generated with progressively bigger radius using the
                        inverse distance weighted (IDW) algorithm and merged
                        together. Remaining gaps are then merged using nearest
                        neighbor interpolation. Default=3
  --dem-resolution <float>
                        DSM/DTM resolution in cm / pixel. Default: 5
  --dem-decimation <positive integer>
                        Decimate the points before generating the DEM. 1 is no
                        decimation (full quality). 100 decimates ~99% of the
                        points. Useful for speeding up generation. Default=1
  --dem-euclidean-map   Computes an euclidean raster map for each DEM. The map
                        reports the distance from each cell to the nearest
                        NODATA value (before any hole filling takes place).
                        This can be useful to isolate the areas that have been
                        filled. Default: False
  --orthophoto-resolution <float > 0.0>
                        Orthophoto resolution in cm / pixel. Default: 5
  --orthophoto-no-tiled
                        Set this parameter if you want a stripped geoTIFF.
                        Default: False
  --orthophoto-compression <string>
                        Set the compression to use. Note that this could break
                        gdal_translate if you don't know what you are doing.
                        Options: JPEG, LZW, PACKBITS, DEFLATE, LZMA, NONE.
                        Default: DEFLATE
  --orthophoto-bigtiff {YES,NO,IF_NEEDED,IF_SAFER}
                        Control whether the created orthophoto is a BigTIFF or
                        classic TIFF. BigTIFF is a variant for files larger
                        than 4GiB of data. Options are YES, NO, IF_NEEDED,
                        IF_SAFER. See GDAL specs:
                        https://www.gdal.org/frmt_gtiff.html for more info.
                        Default: IF_SAFER
  --orthophoto-cutline  Generates a polygon around the cropping area that cuts
                        the orthophoto around the edges of features. This
                        polygon can be useful for stitching seamless mosaics
                        with multiple overlapping orthophotos. Default: False
  --build-overviews     Build orthophoto overviews using gdaladdo.
  --verbose, -v         Print additional messages to the console Default:
                        False
  --time                Generates a benchmark file with runtime info Default:
                        False
  --version             Displays version number and exits.
  --split <positive integer>
                        Average number of images per submodel. When splitting
                        a large dataset into smaller submodels, images are
                        grouped into clusters. This value regulates the number
                        of images that each cluster should have on average.
  --split-overlap <positive integer>
                        Radius of the overlap between submodels. After
                        grouping images into clusters, images that are closer
                        than this radius to a cluster are added to the
                        cluster. This is done to ensure that neighboring
                        submodels overlap.
  --sm-cluster <string>
                        URL to a nodeodm-proxy instance for distributing a
                        split-merge workflow on multiple nodes in parallel.
                        Default: None
  --merge <string>      Choose what to merge in the merge step in a split
                        dataset. By default all available outputs are merged.
                        Default: all