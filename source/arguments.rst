Options and Flags
-----------------

:ref:`auto-boundary<auto-boundary>` 
  Automatically set a boundary using camera shot locations to limit the area of the reconstruction. This can help remove far away background artifacts (sky, background landscapes, etc.). See also --boundary. Default: ``False``

:ref:`boundary<boundary>` <json>
  GeoJSON polygon limiting the area of the reconstruction. Can be specified either as path to a GeoJSON file or as a JSON string representing the contents of a GeoJSON file. Default: ``

:ref:`build-overviews<build-overviews>` 
  Build orthophoto overviews for faster display in programs such as QGIS. Default: ``False``

:ref:`camera-lens<camera-lens>` auto |  perspective |  brown |  fisheye |  spherical
  Set a camera projection type. Manually setting a value can help improve geometric undistortion. By default the application tries to determine a lens type from the images metadata. . Default: ``auto``

:ref:`cameras<cameras>` <json>
  Use the camera parameters computed from another dataset instead of calculating them. Can be specified either as path to a cameras.json file or as a JSON string representing the contents of a cameras.json file. Default: ``

:ref:`cog<cog>` 
  Create Cloud-Optimized GeoTIFFs instead of normal GeoTIFFs. Default: ``False``

:ref:`copy-to<copy-to>` <path>
  Copy output results to this folder after processing.

:ref:`crop<crop>` <positive float>
  Automatically crop image outputs by creating a smooth buffer around the dataset boundaries, shrinked by N meters. Use 0 to disable cropping. Default: ``3``

:ref:`debug<debug>` 
  Print debug messages. Default: ``False``

:ref:`dem-decimation<dem-decimation>` <positive integer>
  Decimate the points before generating the DEM. 1 is no decimation (full quality). 100 decimates ~99%% of the points. Useful for speeding up generation of DEM results in very large datasets. Default: ``1``

:ref:`dem-euclidean-map<dem-euclidean-map>` 
  Computes an euclidean raster map for each DEM. The map reports the distance from each cell to the nearest NODATA value (before any hole filling takes place). This can be useful to isolate the areas that have been filled. Default: ``False``

:ref:`dem-gapfill-steps<dem-gapfill-steps>` <positive integer>
  Number of steps used to fill areas with gaps. Set to 0 to disable gap filling. Starting with a radius equal to the output resolution, N different DEMs are generated with progressively bigger radius using the inverse distance weighted (IDW) algorithm and merged together. Remaining gaps are then merged using nearest neighbor interpolation. Default: ``3``

:ref:`dem-resolution<dem-resolution>` <float>
  DSM/DTM resolution in cm / pixel. Note that this value is capped by a ground sampling distance (GSD) estimate. To remove the cap, check --ignore-gsd also. Default: ``5``

:ref:`depthmap-resolution<depthmap-resolution>` <positive float>
  Legacy option (use --pc-quality instead). Controls the density of the point cloud by setting the resolution of the depthmap images. Higher values take longer to compute but produce denser point clouds. Default: ``640``

:ref:`dsm<dsm>` 
  Use this tag to build a DSM (Digital Surface Model, ground + objects) using a progressive morphological filter. Check the --dem\* parameters for finer tuning. Default: ``False``

:ref:`dtm<dtm>` 
  Use this tag to build a DTM (Digital Terrain Model, ground only) using a simple morphological filter. Check the --dem\* and --smrf\* parameters for finer tuning. Default: ``False``

:ref:`end-with<end-with>` dataset |  split |  merge |  opensfm |  openmvs |  odm_filterpoints |  odm_meshing |  mvs_texturing |  odm_georeferencing |  odm_dem |  odm_orthophoto |  odm_report |  odm_postprocess
  End processing at this stage. . Default: ``odm_postprocess``

:ref:`fast-orthophoto<fast-orthophoto>` 
  Skips dense reconstruction and 3D model generation. It generates an orthophoto directly from the sparse reconstruction. If you just need an orthophoto and do not need a full 3D model, turn on this option. Default: ``False``

:ref:`feature-quality<feature-quality>` ultra |  high |  medium |  low |  lowest
  Set feature extraction quality. Higher quality generates better features, but requires more memory and takes longer. . Default: ``high``

:ref:`feature-type<feature-type>` sift |  orb |  hahog
  Choose the algorithm for extracting keypoints and computing descriptors. . Default: ``sift``

:ref:`force-gps<force-gps>` 
  Use images' GPS exif data for reconstruction, even if there are GCPs present.This flag is useful if you have high precision GPS measurements. If there are no GCPs, this flag does nothing. Default: ``False``

:ref:`gcp<gcp>` <path string>
  Path to the file containing the ground control points used for georeferencing. The file needs to use the following format: EPSG:<code> or <+proj definition>geo_x geo_y geo_z im_x im_y image_name [gcp_name] [extra1] [extra2]Default: ``None``

:ref:`geo<geo>` <path string>
  Path to the image geolocation file containing the camera center coordinates used for georeferencing. Note that omega/phi/kappa are currently not supported (you can set them to 0). The file needs to use the following format: EPSG:<code> or <+proj definition>image_name geo_x geo_y geo_z [omega (degrees)] [phi (degrees)] [kappa (degrees)] [horz accuracy (meters)] [vert accuracy (meters)]Default: ``None``

:ref:`gps-accuracy<gps-accuracy>` <positive float>
  Set a value in meters for the GPS Dilution of Precision (DOP) information for all images. If your images are tagged with high precision GPS information (RTK), this value will be automatically set accordingly. You can use this option to manually set it in case the reconstruction fails. Lowering this option can sometimes help control bowling-effects over large areas. Default: ``10``

:ref:`help<help>` 
  show this help message and exit

:ref:`ignore-gsd<ignore-gsd>` 
  Ignore Ground Sampling Distance (GSD). GSD caps the maximum resolution of image outputs and resizes images when necessary, resulting in faster processing and lower memory usage. Since GSD is an estimate, sometimes ignoring it can result in slightly better image output quality. Default: ``False``

:ref:`matcher-distance<matcher-distance>` <integer>
  Distance threshold in meters to find pre-matching images based on GPS exif data. Set both matcher-neighbors and this to 0 to skip pre-matching. Default: ``0``

:ref:`matcher-neighbors<matcher-neighbors>` <integer>
  Number of nearest images to pre-match based on GPS exif data. Set to 0 to skip pre-matching. Neighbors works together with Distance parameter, set both to 0 to not use pre-matching. Default: ``8``

:ref:`matcher-type<matcher-type>` flann |  bow
  Matcher algorithm, Fast Library for Approximate Nearest Neighbors or Bag of Words. FLANN is slower, but more stable. BOW is faster, but can sometimes miss valid matches. . Default: ``flann``

:ref:`max-concurrency<max-concurrency>` <positive integer>
  The maximum number of processes to use in various processes. Peak memory requirement is ~1GB per thread and 2 megapixel image resolution. Default: ``4``

:ref:`merge<merge>` all |  pointcloud |  orthophoto |  dem
  Choose what to merge in the merge step in a split dataset. By default all available outputs are merged. Options: ['all', 'pointcloud', 'orthophoto', 'dem']. Default: ``all``

:ref:`mesh-octree-depth<mesh-octree-depth>` <integer: 1 <= x <= 14>
  Octree depth used in the mesh reconstruction, increase to get more vertices, recommended values are 8-12. Default: ``11``

:ref:`mesh-size<mesh-size>` <positive integer>
  The maximum vertex count of the output mesh. Default: ``200000``

:ref:`min-num-features<min-num-features>` <integer>
  Minimum number of features to extract per image. More features can be useful for finding more matches between images, potentially allowing the reconstruction of areas with little overlap or insufficient features. More features also slow down processing. Default: ``8000``

:ref:`name<name>` <dataset name>
  Name of dataset (i.e subfolder name within project folder). Default: ``code``

:ref:`optimize-disk-space<optimize-disk-space>` 
  Delete heavy intermediate files to optimize disk space usage. This affects the ability to restart the pipeline from an intermediate stage, but allows datasets to be processed on machines that don't have sufficient disk space available. Default: ``False``

:ref:`orthophoto-compression<orthophoto-compression>` JPEG |  LZW |  PACKBITS |  DEFLATE |  LZMA |  NONE
  Set the compression to use for orthophotos. . Default: ``DEFLATE``

:ref:`orthophoto-cutline<orthophoto-cutline>` 
  Generates a polygon around the cropping area that cuts the orthophoto around the edges of features. This polygon can be useful for stitching seamless mosaics with multiple overlapping orthophotos. Default: ``False``

:ref:`orthophoto-kmz<orthophoto-kmz>` 
  Set this parameter if you want to generate a Google Earth (KMZ) rendering of the orthophoto. Default: ``False``

:ref:`orthophoto-no-tiled<orthophoto-no-tiled>` 
  Set this parameter if you want a striped GeoTIFF. Default: ``False``

:ref:`orthophoto-png<orthophoto-png>` 
  Set this parameter if you want to generate a PNG rendering of the orthophoto. Default: ``False``

:ref:`orthophoto-resolution<orthophoto-resolution>` <float > 0.0>
  Orthophoto resolution in cm / pixel. Note that this value is capped by a ground sampling distance (GSD) estimate. To remove the cap, check --ignore-gsd also. Default: ``5``

:ref:`pc-classify<pc-classify>` 
  Classify the point cloud outputs using a Simple Morphological Filter. You can control the behavior of this option by tweaking the --dem-\* parameters. Default: ``False``

:ref:`pc-csv<pc-csv>` 
  Export the georeferenced point cloud in CSV format. Default: ``False``

:ref:`pc-ept<pc-ept>` 
  Export the georeferenced point cloud in Entwine Point Tile (EPT) format. Default: ``False``

:ref:`pc-filter<pc-filter>` <positive float>
  Filters the point cloud by removing points that deviate more than N standard deviations from the local mean. Set to 0 to disable filtering. Default: ``2.5``

:ref:`pc-geometric<pc-geometric>` 
  Improve the accuracy of the point cloud by computing geometrically consistent depthmaps. This increases processing time, but can improve results in urban scenes. Default: ``False``

:ref:`pc-las<pc-las>` 
  Export the georeferenced point cloud in LAS format. Default: ``False``

:ref:`pc-quality<pc-quality>` ultra |  high |  medium |  low |  lowest
  Set point cloud quality. Higher quality generates better, denser point clouds, but requires more memory and takes longer. Each step up in quality increases processing time roughly by a factor of 4x.. Default: ``medium``

:ref:`pc-rectify<pc-rectify>` 
  Perform ground rectification on the point cloud. This means that wrongly classified ground points will be re-classified and gaps will be filled. Useful for generating DTMs. Default: ``False``

:ref:`pc-sample<pc-sample>` <positive float>
  Filters the point cloud by keeping only a single point around a radius N (in meters). This can be useful to limit the output resolution of the point cloud and remove duplicate points. Set to 0 to disable sampling. Default: ``0``

:ref:`pc-tile<pc-tile>` 
  Reduce the memory usage needed for depthmap fusion by splitting large scenes into tiles. Turn this on if your machine doesn't have much RAM and/or you've set --pc-quality to high or ultra. Experimental. Default: ``False``

:ref:`primary-band<primary-band>` <string>
  When processing multispectral datasets, you can specify the name of the primary band that will be used for reconstruction. It's recommended to choose a band which has sharp details and is in focus. Default: ``auto``

:ref:`project-path<project-path>` <path>
  Path to the project folder. Your project folder should contain subfolders for each dataset. Each dataset should have an "images" folder.

:ref:`radiometric-calibration<radiometric-calibration>` none |  camera |  camera+sun
  Set the radiometric calibration to perform on images. When processing multispectral and thermal images you should set this option to obtain reflectance/temperature values (otherwise you will get digital number values). [camera] applies black level, vignetting, row gradient gain/exposure compensation (if appropriate EXIF tags are found) and computes absolute temperature values. [camera+sun] is experimental, applies all the corrections of [camera], plus compensates for spectral radiance registered via a downwelling light sensor (DLS) taking in consideration the angle of the sun. . Default: ``none``

:ref:`rerun<rerun>` dataset |  split |  merge |  opensfm |  openmvs |  odm_filterpoints |  odm_meshing |  mvs_texturing |  odm_georeferencing |  odm_dem |  odm_orthophoto |  odm_report |  odm_postprocess
  Rerun this stage only and stop. . Default: ``

:ref:`rerun-all<rerun-all>` 
  Permanently delete all previous results and rerun the processing pipeline.

:ref:`rerun-from<rerun-from>` dataset |  split |  merge |  opensfm |  openmvs |  odm_filterpoints |  odm_meshing |  mvs_texturing |  odm_georeferencing |  odm_dem |  odm_orthophoto |  odm_report |  odm_postprocess
  Rerun processing from this stage. . Default: ``

:ref:`resize-to<resize-to>` <integer>
  Legacy option (use --feature-quality instead). Resizes images by the largest side for feature extraction purposes only. Set to -1 to disable. This does not affect the final orthophoto resolution quality and will not resize the original images. Default: ``2048``

:ref:`skip-3dmodel<skip-3dmodel>` 
  Skip generation of a full 3D model. This can save time if you only need 2D results such as orthophotos and DEMs. Default: ``False``

:ref:`skip-band-alignment<skip-band-alignment>` 
  When processing multispectral datasets, ODM will automatically align the images for each band. If the images have been postprocessed and are already aligned, use this option. Default: ``False``

:ref:`skip-report<skip-report>` 
  Skip generation of PDF report. This can save time if you don't need a report. Default: ``False``

:ref:`sm-cluster<sm-cluster>` <string>
  URL to a ClusterODM instance for distributing a split-merge workflow on multiple nodes in parallel. Default: ``None``

:ref:`smrf-scalar<smrf-scalar>` <positive float>
  Simple Morphological Filter elevation scalar parameter. Default: ``1.25``

:ref:`smrf-slope<smrf-slope>` <positive float>
  Simple Morphological Filter slope parameter (rise over run). Default: ``0.15``

:ref:`smrf-threshold<smrf-threshold>` <positive float>
  Simple Morphological Filter elevation threshold parameter (meters). Default: ``0.5``

:ref:`smrf-window<smrf-window>` <positive float>
  Simple Morphological Filter window radius parameter (meters). Default: ``18.0``

:ref:`split<split>` <positive integer>
  Average number of images per submodel. When splitting a large dataset into smaller submodels, images are grouped into clusters. This value regulates the number of images that each cluster should have on average. Default: ``999999``

:ref:`split-image-groups<split-image-groups>` <path string>
  Path to the image groups file that controls how images should be split into groups. The file needs to use the following format: image_name group_nameDefault: ``None``

:ref:`split-overlap<split-overlap>` <positive integer>
  Radius of the overlap between submodels. After grouping images into clusters, images that are closer than this radius to a cluster are added to the cluster. This is done to ensure that neighboring submodels overlap. Default: ``150``

:ref:`texturing-data-term<texturing-data-term>` gmi |  area
  When texturing the 3D mesh, for each triangle, choose to prioritize images with sharp features (gmi) or those that cover the largest area (area). Default: ``gmi``

:ref:`texturing-keep-unseen-faces<texturing-keep-unseen-faces>` 
  Keep faces in the mesh that are not seen in any camera. Default:  ``False``

:ref:`texturing-outlier-removal-type<texturing-outlier-removal-type>` none |  gauss_clamping |  gauss_damping
  Type of photometric outlier removal method. . Default: ``gauss_clamping``

:ref:`texturing-skip-global-seam-leveling<texturing-skip-global-seam-leveling>` 
  Skip normalization of colors across all images. Useful when processing radiometric data. Default: ``False``

:ref:`texturing-skip-local-seam-leveling<texturing-skip-local-seam-leveling>` 
  Skip the blending of colors near seams. Default: ``False``

:ref:`texturing-tone-mapping<texturing-tone-mapping>` none |  gamma
  Turn on gamma tone mapping or none for no tone mapping. Can be one of ['none', 'gamma']. Default: ``none`` 

:ref:`tiles<tiles>` 
  Generate static tiles for orthophotos and DEMs that are suitable for viewers like Leaflet or OpenLayers. Default: ``False``

:ref:`time<time>` 
  Generates a benchmark file with runtime info. Default: ``False``

:ref:`use-3dmesh<use-3dmesh>` 
  Use a full 3D mesh to compute the orthophoto instead of a 2.5D mesh. This option is a bit faster and provides similar results in planar areas. Default: ``False``

:ref:`use-exif<use-exif>` 
  Use this tag if you have a GCP File but want to use the EXIF information for georeferencing instead. Default: ``False``

:ref:`use-fixed-camera-params<use-fixed-camera-params>` 
  Turn off camera parameter optimization during bundle adjustment. This can be sometimes useful for improving results that exhibit doming/bowling or when images are taken with a rolling shutter camera. Default: ``False``

:ref:`use-hybrid-bundle-adjustment<use-hybrid-bundle-adjustment>` 
  Run local bundle adjustment for every image added to the reconstruction and a global adjustment every 100 images. Speeds up reconstruction for very large datasets. Default: ``False``

:ref:`verbose<verbose>` 
  Print additional messages to the console. Default: ``False``

:ref:`version<version>` 
  Displays version number and exits. 




`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/arguments.rst>`_!

.. toctree::
    :maxdepth: 1
    :glob:

    arguments/*