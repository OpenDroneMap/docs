.. _arguments:

Options and Flags
-----------------

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


`Help edit these docs! <https://github.com/OpenDroneMap/docs/blob/publish/source/using.rst>`_