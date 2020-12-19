.. _arguments:

Options and Flags
-----------------

Arguments
`````````

``--build-overviews`` 
  Build orthophoto overviews using gdaladdo.

``--camera-lens`` auto |  perspective |  brown |  fisheye |  spherical
  Set a camera projection type. Manually setting a value can help improve geometric undistortion. By default the application tries to determine a lens type from the images metadata. Can be set to one of: ['auto', 'perspective', 'brown', 'fisheye', 'spherical']. Default: ``auto``

``--cameras`` <json>
  Use the camera parameters computed from another dataset instead of calculating them. Can be specified either as path to a cameras.json file or as a JSON string representing the contents of a cameras.json file. Default: ``

``--crop`` <positive float>
  Automatically crop image outputs by creating a smooth buffer around the dataset boundaries, shrinked by N meters. Use 0 to disable cropping. Default: ``3``

``--debug`` 
  Print debug messagesDefault: ``False``

``--dem-decimation`` <positive integer>
  Decimate the points before generating the DEM. 1 is no decimation (full quality). 100 decimates ~99%% of the points. Useful for speeding up generation.Default=``1``

``--dem-euclidean-map`` 
  Computes an euclidean raster map for each DEM. The map reports the distance from each cell to the nearest NODATA value (before any hole filling takes place). This can be useful to isolate the areas that have been filled. Default: ``False``

``--dem-gapfill-steps`` <positive integer>
  Number of steps used to fill areas with gaps. Set to 0 to disable gap filling. Starting with a radius equal to the output resolution, N different DEMs are generated with progressively bigger radius using the inverse distance weighted (IDW) algorithm and merged together. Remaining gaps are then merged using nearest neighbor interpolation. Default=``3``

``--dem-resolution`` <float>
  DSM/DTM resolution in cm / pixel. Note that this value is capped by a ground sampling distance (GSD) estimate. To remove the cap, check --ignore-gsd also.Default: ``5``

``--depthmap-resolution`` <positive float>
  Legacy option (use --pc-quality instead). Controls the density of the point cloud by setting the resolution of the depthmap images. Higher values take longer to compute but produce denser point clouds. Default: ``640``

``--dsm`` 
  Use this tag to build a DSM (Digital Surface Model, ground + objects) using a progressive morphological filter. Check the --dem* parameters for finer tuning.

``--dtm`` 
  Use this tag to build a DTM (Digital Terrain Model, ground only) using a simple morphological filter. Check the --dem* and --smrf* parameters for finer tuning.

``--end-with,-e`` dataset |  split |  merge |  opensfm |  openmvs |  odm_filterpoints |  odm_meshing |  mvs_texturing |  odm_georeferencing |  odm_dem |  odm_orthophoto |  odm_report
  Can be one of:dataset | split | merge | opensfm | openmvs | odm_filterpoints | odm_meshing | mvs_texturing | odm_georeferencing | odm_dem | odm_orthophoto | odm_report

``--fast-orthophoto`` 
  Skips dense reconstruction and 3D model generation. It generates an orthophoto directly from the sparse reconstruction. If you just need an orthophoto and do not need a full 3D model, turn on this option.

``--feature-quality`` ultra |  high |  medium |  low |  lowest
  Set feature extraction quality. Higher quality generates better features, but requires more memory and takes longer. . Default: ``high``

``--feature-type`` sift |  hahog
  Choose the algorithm for extracting keypoints and computing descriptors. . Default: ``sift``

``--force-gps`` 
  Use images' GPS exif data for reconstruction, even if there are GCPs present.This flag is useful if you have high precision GPS measurements. If there are no GCPs, this flag does nothing. Default: ``False``

``--gcp`` <path string>
  Path to the file containing the ground control points used for georeferencing.  Default: ``None``. The file needs to use the following format: EPSG:<code> or <+proj definition>geo_x geo_y geo_z im_x im_y image_name [gcp_name] [extra1] [extra2]

``--geo`` <path string>
  Path to the image geolocation file containing the camera center coordinates used for georeferencing. Note that omega/phi/kappa are currently not supported (you can set them to 0). Default: ``None``. The file needs to use the following format: EPSG:<code> or <+proj definition>image_name geo_x geo_y geo_z [omega (degrees)] [phi (degrees)] [kappa (degrees)] [horz accuracy (meters)] [vert accuracy (meters)]

``--gps-accuracy`` <positive float>
  Set a value in meters for the GPS Dilution of Precision (DOP) information for all images. If your images are tagged with high precision GPS information (RTK), this value will be automatically set accordingly. You can use this option to manually set it in case the reconstruction fails. Lowering this option can sometimes help control bowling-effects over large areas. Default: ``10``

``-h,--help`` 
  show this help message and exit

``--ignore-gsd`` 
  Ignore Ground Sampling Distance (GSD). GSD caps the maximum resolution of image outputs and resizes images when necessary, resulting in faster processing and lower memory usage. Since GSD is an estimate, sometimes ignoring it can result in slightly better image output quality.

``--matcher-distance`` <integer>
  Distance threshold in meters to find pre-matching images based on GPS exif data. Set both matcher-neighbors and this to 0 to skip pre-matching. Default: ``0``

``--matcher-neighbors`` <integer>
  Number of nearest images to pre-match based on GPS exif data. Set to 0 to skip pre-matching. Neighbors works together with Distance parameter, set both to 0 to not use pre-matching. OpenSFM uses both parameters at the same time, Bundler uses only one which has value, prefering the Neighbors parameter. Default: ``8``

``--matcher-type`` flann |  bow
  Matcher algorithm, Fast Library for Approximate Nearest Neighbors or Bag of Words. FLANN is slower, but more stable. BOW is faster, but can sometimes miss valid matches. . Default: ``flann``

``--max-concurrency`` <positive integer>
  The maximum number of processes to use in various processes. Peak memory requirement is ~1GB per thread and 2 megapixel image resolution. Default: ``4``

``--merge`` all |  pointcloud |  orthophoto |  dem
  Choose what to merge in the merge step in a split dataset. By default all available outputs are merged. Options: ['all', 'pointcloud', 'orthophoto', 'dem']. Default: ``all``

``--mesh-octree-depth`` <positive integer>
  Oct-tree depth used in the mesh reconstruction, increase to get more vertices, recommended values are 8-12. Default: ``10``

``--mesh-point-weight`` <positive float>
  This floating point value specifies the importance that interpolation of the point samples is given in the formulation of the screened Poisson equation. The results of the original (unscreened) Poisson Reconstruction can be obtained by setting this value to 0.Default= ``4``

``--mesh-samples`` <float >= 1.0>
  Number of points per octree node, recommended and default value: ``1.0``

``--mesh-size`` <positive integer>
  The maximum vertex count of the output mesh. Default: ``200000``

``--min-num-features`` <integer>
  Minimum number of features to extract per image. More features leads to better results but slower execution. Default: ``8000``

``name`` <project name>
  Name of Project (i.e subdirectory of projects folder)

``--opensfm-depthmap-method`` PATCH_MATCH |  BRUTE_FORCE |  PATCH_MATCH_SAMPLE
  Raw depthmap computation algorithm. PATCH_MATCH and PATCH_MATCH_SAMPLE are faster, but might miss some valid points. BRUTE_FORCE takes longer but produces denser reconstructions. Default: ``PATCH_MATCH``

``--opensfm-depthmap-min-consistent-views`` <integer: 2 <= x <= 9>
  Minimum number of views that should reconstruct a point for it to be valid. Use lower values if your images have less overlap. Lower values result in denser point clouds but with more noise. Default: ``3``

``--opensfm-depthmap-min-patch-sd`` <positive float>
  When using PATCH_MATCH or PATCH_MATCH_SAMPLE, controls the standard deviation threshold to include patches. Patches with lower standard deviation are ignored. Default: ``1``

``--optimize-disk-space`` 
  Delete heavy intermediate files to optimize disk space usage. This affects the ability to restart the pipeline from an intermediate stage, but allows datasets to be processed on machines that don't have sufficient disk space available. Default: ``False``

``--orthophoto-compression`` JPEG |  LZW |  PACKBITS |  DEFLATE |  LZMA |  NONE
  Set the compression to use for orthophotos. Options: ['JPEG', 'LZW', 'PACKBITS', 'DEFLATE', 'LZMA', 'NONE'].Default: ``DEFLATE``

``--orthophoto-cutline`` 
  Generates a polygon around the cropping area that cuts the orthophoto around the edges of features. This polygon can be useful for stitching seamless mosaics with multiple overlapping orthophotos. Default: ``False``

``--orthophoto-no-tiled`` 
  Set this parameter if you want a stripped geoTIFF.Default: ``False``

``--orthophoto-png`` 
  Set this parameter if you want to generate a PNG rendering of the orthophoto.Default: ``False``

``--orthophoto-resolution`` <float > 0.0>
  Orthophoto resolution in cm / pixel. Note that this value is capped by a ground sampling distance (GSD) estimate. To remove the cap, check --ignore-gsd also.Default: ``5``

``--pc-classify`` 
  Classify the point cloud outputs using a Simple Morphological Filter. You can control the behavior of this option by tweaking the --dem-* parameters. Default: ``False``

``--pc-csv`` 
  Export the georeferenced point cloud in CSV format. Default:  ``False``

``--pc-ept`` 
  Export the georeferenced point cloud in Entwine Point Tile (EPT) format. Default:  ``False``

``--pc-filter`` <positive float>
  Filters the point cloud by removing points that deviate more than N standard deviations from the local mean. Set to 0 to disable filtering.Default: ``2.5``

``--pc-las`` 
  Export the georeferenced point cloud in LAS format. Default:  ``False``

``--pc-quality`` ultra |  high |  medium |  low |  lowest
  Set point cloud quality. Higher quality generates better, denser point clouds, but requires more memory and takes longer. Each step up in quality increases processing time roughly by a factor of 4x.. Default: ``medium``

``--pc-rectify`` 
  Perform ground rectification on the point cloud. This means that wrongly classified ground points will be re-classified and gaps will be filled. Useful for generating DTMs. Default: ``False``

``--pc-sample`` <positive float>
  Filters the point cloud by keeping only a single point around a radius N (in meters). This can be useful to limit the output resolution of the point cloud. Set to 0 to disable sampling.Default: ``0``

``--primary-band`` <string>
  When processing multispectral datasets, you can specify the name of the primary band that will be used for reconstruction. It's recommended to choose a band which has sharp details and is in focus. Default: ``auto``

``--project-path`` <path>
  Path to the project folder

``--radiometric-calibration`` none |  camera |  camera+sun
  Set the radiometric calibration to perform on images. When processing multispectral images you should set this option to obtain reflectance values (otherwise you will get digital number values). [camera] applies black level, vignetting, row gradient gain/exposure compensation (if appropriate EXIF tags are found). [camera+sun] is experimental, applies all the corrections of [camera], plus compensates for spectral radiance registered via a downwelling light sensor (DLS) taking in consideration the angle of the sun. Can be set to one of: ['none', 'camera', 'camera+sun']. Default: ``none``

``--rerun,-r`` dataset |  split |  merge |  opensfm |  openmvs |  odm_filterpoints |  odm_meshing |  mvs_texturing |  odm_georeferencing |  odm_dem |  odm_orthophoto |  odm_report
  Can be one of:dataset | split | merge | opensfm | openmvs | odm_filterpoints | odm_meshing | mvs_texturing | odm_georeferencing | odm_dem | odm_orthophoto | odm_report

``--rerun-all`` 
  force rerun of all tasks

``--rerun-from`` dataset |  split |  merge |  opensfm |  openmvs |  odm_filterpoints |  odm_meshing |  mvs_texturing |  odm_georeferencing |  odm_dem |  odm_orthophoto |  odm_report
  Can be one of:dataset | split | merge | opensfm | openmvs | odm_filterpoints | odm_meshing | mvs_texturing | odm_georeferencing | odm_dem | odm_orthophoto | odm_report

``--resize-to`` <integer>
  Legacy option (use --feature-quality instead). Resizes images by the largest side for feature extraction purposes only. Set to -1 to disable. This does not affect the final orthophoto resolution quality and will not resize the original images. Default:  ``2048``

``--skip-3dmodel`` 
  Skip generation of a full 3D model. This can save time if you only need 2D results such as orthophotos and DEMs.

``--skip-band-alignment`` 
  When processing multispectral datasets, ODM will automatically align the images for each band. If the images have been postprocessed and are already aligned, use this option. Default: ``False``

``--sm-cluster`` <string>
  URL to a ClusterODM instance for distributing a split-merge workflow on multiple nodes in parallel. Default: ``None``

``--smrf-scalar`` <positive float>
  Simple Morphological Filter elevation scalar parameter. Default: ``1.25``

``--smrf-slope`` <positive float>
  Simple Morphological Filter slope parameter (rise over run). Default: ``0.15``

``--smrf-threshold`` <positive float>
  Simple Morphological Filter elevation threshold parameter (meters). Default: ``0.5``

``--smrf-window`` <positive float>
  Simple Morphological Filter window radius parameter (meters). Default: ``18.0``

``--split`` <positive integer>
  Average number of images per submodel. When splitting a large dataset into smaller submodels, images are grouped into clusters. This value regulates the number of images that each cluster should have on average.

``--split-multitracks`` 
  Split multi-track reconstructions.

``--split-overlap`` <positive integer>
  Radius of the overlap between submodels. After grouping images into clusters, images that are closer than this radius to a cluster are added to the cluster. This is done to ensure that neighboring submodels overlap.

``--texturing-data-term`` gmi |  area
  Data term: [area, gmi]. Default: ``gmi``

``--texturing-outlier-removal-type`` none |  gauss_clamping |  gauss_damping
  Type of photometric outlier removal method: [none, gauss_damping, gauss_clamping]. Default: ``gauss_clamping``

``--texturing-skip-global-seam-leveling`` 
  Skip global seam leveling. Useful for IR data.Default: ``False``

``--texturing-skip-local-seam-leveling`` 
  Skip local seam blending. Default:  ``False``

``--texturing-tone-mapping`` none |  gamma
  Turn on gamma tone mapping or none for no tone mapping. Choices are  'gamma' or 'none'. Default: ``none`` 

``--tiles`` 
  Generate static tiles for orthophotos and DEMs that are suitable for viewers like Leaflet or OpenLayers. Default: ``False``

``--time`` 
  Generates a benchmark file with runtime infoDefault: ``False``

``--use-3dmesh`` 
  Use a full 3D mesh to compute the orthophoto instead of a 2.5D mesh. This option is a bit faster and provides similar results in planar areas.

``--use-exif`` 
  Use this tag if you have a gcp_list.txt but want to use the exif geotags instead

``--use-fixed-camera-params`` 
  Turn off camera parameter optimization during bundler

``--use-hybrid-bundle-adjustment`` 
  Run local bundle adjustment for every image added to the reconstruction and a global adjustment every 100 images. Speeds up reconstruction for very large datasets.

``--use-opensfm-dense`` 
  Use opensfm to compute dense point cloud alternatively

``--verbose,-v`` 
  Print additional messages to the consoleDefault: ``False``

``--version`` 
  Displays version number and exits. 




`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/arguments.rst>`_!
