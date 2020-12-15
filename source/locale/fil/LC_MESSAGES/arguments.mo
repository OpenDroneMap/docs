��    s      �              L  �   M  �   ,  	   	  �   !	  �   �	  *   �
  g   �
  �     �   �  �   �  �   R  !     �   $     �     �     �     �                1     @     Q     c     w     �     �     �     �     �     �     �     �     	          *     9     N     a     w     �     �     �     �     �     �  �    �   �  +   7  �   c  3   �  3   /  �   c     �  �     -   �  �       �  7   �  l   0  �   �  2  �  �   �  W  s  k   �     7  N   I  C   �  8   �       M   1  �        =  /   [  :   �  A   �  $         -   �   C      �   )   !  C   B!  �   �!  �   ^"  �   #  �   �#  t   u$  k   �$  �   V%  2   &     Q&  7   m&  C   �&  <   �&  =   &'  "   d'  p   �'     �'  .   (     G(  �   a(  ,   �(    )  i   !*  7   �*  +   �*  c   �*  �   S+  7   �+  Q   ,  �   l,  �   -  �   �-  �   ].  {   </    �/  �   �1  V  �2     +4  �   94     	5  2   
6  f   =6  �   �6  �   e7  �   8  �   9  $   �9  �   :     �:     �:     �:     ;     ;     %;     6;     E;     V;     h;     |;     �;     �;     �;     �;     �;     �;     �;     �;     <      <     /<     ><     S<     f<     |<     �<     �<     �<     �<     �<     �<  �  	=  �   �>  5   l?  �   �?  5   V@  4   �@  �   �@     yA  �   �A  /   �B  �   �B  W  ~C  8   �D  �   E  U  �E  �  �F  �   �H  �  WI  k   "K     �K  R   �K  G   �K  <   =L     zL  Q   �L  �   �L  !   �M  3   �M  >   �M  E   >N  $   �N     �N  �   �N     ~O  +   �O  R   �O  �   P  �   Q  �   �Q  �   �R  �   �S     GT  �   �T  9   �U  %   �U  7   V  C   LV  <   �V  =   �V  *   W  �   6W  '   �W  <   �W  !   &X  �   HX  3   �X  -  Y  �   IZ  ?   �Z  ,   [  c   =[  �   �[  F   6\  Y   }\  �   �\  �   �]  �   a^  �   3_  �   `   **Experimental.** Skips dense reconstruction and 3D model generation. It generates an orthophoto directly from the sparse reconstruction. If you just need an orthophoto and do not need a full 3D model, turn on this option. Affects orthophotos only. Higher values result in sharper corners, but can affect color distribution and blurriness. Use lower values for planar areas and higher values for urban areas. The default value works well for most scenarios. Arguments Automatically crop image outputs by creating a smooth buffer around the dataset boundaries, shrinked by N meters. Use ``0`` to disable cropping. Average number of images per submodel. When splitting a large dataset into smaller submodels, images are grouped into clusters. This value regulates the number of images that each cluster should have on average. Build orthophoto overviews using gdaladdo. Choose what to merge in the merge step in a split dataset. By default all available outputs are merged. Classify the point cloud outputs using a Simple Morphological Filter. You can control the behavior of this option by tweaking the ``--dem-*`` parameters. Computes an euclidean raster map for each DEM. The map reports the distance from each cell to the nearest NODATA value (before any hole filling takes place). This can be useful to isolate the areas that have been filled. Control whether the created orthophoto is a BigTIFF or classic TIFF. BigTIFF is a variant for files larger than 4GiB of data. See GDAL specs: https://www.gdal.org/frmt_gtiff.html for more info. Controls the density of the point cloud by setting the resolution of the depthmap images. Higher values take longer to compute and more memory but produce denser point clouds. DSM/DTM resolution in cm / pixel. Decimate the points before generating the DEM. ``1`` is no decimation (full quality). ``100`` decimates ~99% of the points. Useful for speeding up generation. Default: *None* Default: *number of cores* Default: None. Default: ``0.15`` Default: ``0.5`` Default: ``0.6`` Default: ``0`` Default: ``1.0`` Default: ``1.25`` Default: ``100000`` Default: ``16`` Default: ``18.0`` Default: ``1`` Default: ``2.5`` Default: ``2048`` Default: ``3`` Default: ``4`` Default: ``5`` Default: ``640`` Default: ``8000`` Default: ``8`` Default: ``9`` Default: ``DEFLATE`` Default: ``False`` Default: ``IF_SAFER`` Default: ``PATCH_MATCH`` Default: ``all`` Default: ``auto`` Default: ``gauss_clamping`` Default: ``gmi`` Default: ``high`` Default: ``none`` Delete heavy intermediate files (such as original orthos, dtm, dsm) to optimize disk space usage, while keeping the compressed versions. This affects the ability to restart the pipeline from an intermediate stage, but allows datasets to be processed on machines that don't have sufficient disk space available. Also, in this mode, the "reports" does not get written under the output 'opensfm' folder. Discard points that have less than a certain confidence threshold. This only affects dense reconstructions performed with MVE. Higher values discard more points. Displays software version number and exits. Distance threshold in meters to find pre-matching images based on GPS exif data. Set both ``matcher-neighbors`` and this to ``0`` to skip pre-matching. Export the georeferenced point cloud in CSV format. Export the georeferenced point cloud in LAS format. Filters the point cloud by removing points that deviate more than N standard deviations from the local mean. Set to ``0`` to disable filtering. Force rerun of all tasks. Generates Entwine Point Cloud. Useful on its own, this flag is automatically added when running in WebODM and useful for creating the correct directory structure when running on NodeODM or command line for import into WebODM. Generates a benchmark file with runtime info. Generates a polygon around the cropping area that cuts the orthophoto around the edges of features. This polygon can be useful for stitching seamless mosaics with multiple overlapping orthophotos. Ignore Ground Sampling Distance (GSD). GSD caps the maximum resolution of image outputs and resizes images when necessary, resulting in faster processing and lower memory usage. Since GSD is an estimate, sometimes ignoring it can result in slightly better image output quality. Keep faces in the mesh that are not seen in any camera. Minimum number of features to extract per image. More features leads to better results but slower execution. Minimum number of views that should reconstruct a point for it to be valid. Use lower values if your images have less overlap. Lower values result in denser point clouds but with more noise. Only applies if using OpenSfM for dense matching. Number of nearest images to pre-match based on GPS exif data. Set to ``0`` to skip pre-matching. Neighbors works together with Distance parameter, set both to 0 to not use pre-matching. OpenSFM uses both parameters at the same time, Bundler uses only one which has value, prefering the Neighbors parameter. Number of points per octree node. For relatively low noise, values in the range of [1-5] can be used. For noisier datasets, large values in the range of [15-20] may be employed. Number of steps used to fill areas with gaps. Set to ``0`` to disable gap filling. Starting with a radius equal to the output resolution, N different DEMs are generated with progressively bigger radius using the inverse distance weighted (IDW) algorithm and merged together. Remaining gaps are then merged using nearest neighbor interpolation. Oct-tree depth used in the mesh reconstruction, increase to get more vertices, recommended values are 8-12. Options and Flags Options: ``JPEG`` | ``LZW`` | ``PACKBITS`` | ``DEFLATE`` | ``LZMA`` | ``NONE`` Options: ``PATCH_MATCH`` | ``PATCH_MATCH_SAMPLE`` | ``BRUTE_FORCE`` Options: ``YES`` | ``NO`` | ``IF_NEEDED`` | ``IF_SAFER`` Options: ``area`` | ``gmi`` Options: ``auto`` | ``perspective`` | ``brown`` | ``fisheye`` | ``spherical`` Options: ``dataset`` | ``split`` | ``merge`` | ``opensfm`` | ``mve`` | ``odm_filterpoints`` | ``odm_meshing`` | ``mvs_texturing`` | ``odm_georeferencing`` | ``odm_dem`` | ``odm_orthophoto`` Options: ``gamma`` | ``none`` Options: ``none`` | ``camera`` | ``camera+sun`` Options: ``none`` | ``gauss_damping`` | ``gauss_clamping`` Options: ``ultra`` | ``high`` | ``medium`` | ``low`` | ``lowest`` Orthophoto resolution in cm / pixel. Path to input images. Path to the file containing the ground control points used for georeferencing. The file needs to have the following line format: ``easting northing height pixelrow pixelcol imagename`` Path to the project folder. Print additional messages to the console. Projection used to transform the model into geographic coordinates. Radius of the overlap between submodels. After grouping images into clusters, images that are closer than this radius to a cluster are added to the cluster. This is done to ensure that neighboring submodels overlap. Raw depthmap computation algorithm. ``PATCH_MATCH`` and ``PATCH_MATCH_SAMPLE`` are faster, but might miss some valid points. ``BRUTE_FORCE`` takes longer but produces denser reconstructions. Run local bundle adjustment for every image added to the reconstruction and a global adjustment every 100 images. Speeds up reconstruction for very large datasets. Set a camera projection type. Manually setting a value can help improve geometric undistortion. By default the application tries to determine a lens type from the images metadata. Set feature extraction quality. Higher quality generates better features, but requires more memory and takes longer. Set the compression to use. Note that this could break gdal_translate if you don't know what you are doing. Set the radiometric calibration to perform on images. When processing multispectral images you should set this option to obtain reflectance values (otherwise you will get digital number (DN) values). Set this parameter if you want a stripped geoTIFF. Show help message and exit. Simple Morphological Filter elevation scalar parameter. Simple Morphological Filter elevation threshold parameter (meters). Simple Morphological Filter slope parameter (rise over run). Simple Morphological Filter window radius parameter (meters). Skip filling of holes in the mesh. Skip generation of a full 3D model. This can save time if you only need 2D results such as orthophotos and DEMs. Skip geometric visibility test. Skip global seam leveling. Useful for IR data. Skip local seam blending. The maximum number of processes to use in various processes. Peak memory requirement is ~1GB per thread and 2 megapixel image resolution. The maximum vertex count of the output mesh. This floating point value specifies the importance that interpolation of the point samples is given in the formulation of the screened Poisson equation. The results of the original (unscreened) Poisson Reconstruction can be obtained by setting this value to ``0``. Turn off camera parameter optimization during bundler. Off by default unless ``--camera`` parameter used. Turn on gamma tone mapping or none for no tone mapping. Type of photometric outlier removal method. URL to a ClusterODM instance for distributing a split-merge workflow on multiple nodes in parallel. Use a full 3D mesh to compute the orthophoto instead of a 2.5D mesh. This option is a bit faster and provides similar results in planar areas. Use opensfm to compute dense point cloud alternatively. Use this tag if you have a gcp_list.txt but want to use the exif geotags instead. Use this tag to build a DSM (Digital Surface Model, ground + objects) using a progressive morphological filter. Check the ``--dem*`` parameters for finer tuning. Use this tag to build a DTM (Digital Terrain Model, ground only) using a simple morphological filter. Check the ``--dem*`` and ``--smrf*`` parameters for finer tuning. When using ``PATCH_MATCH`` or ``PATCH_MATCH_SAMPLE``, controls the standard deviation threshold to include patches. Patches with lower standard deviation are ignored. [``camera+sun``] is experimental, applies all the corrections of [``camera``] and additionally compensates for spectral radiance registered via a downwelling light sensor (DLS) taking in consideration the angle of the sun. [``camera``] applies black level, vignetting, row gradient gain/exposure compensation (if appropriate EXIF tags are found). Project-Id-Version: OpenDroneMap 2.0.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-12-15 09:17-0500
PO-Revision-Date: 2020-07-21 21:10+0000
Last-Translator: Ma. Carmina Filamor-Badajos <mina.filamor@yahoo.com>, 2020
Language: fil
Language-Team: Filipino (https://www.transifex.com/americanredcross/teams/111882/fil/)
Plural-Forms: nplurals=2; plural=(n == 1 || n==2 || n==3) || (n % 10 != 4 || n % 10 != 6 || n % 10 != 9)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 ** Eksperimental. ** Nilaktawan ang masinsin na pagyari at pagbuo ng modelong 3D. Bumubuo ito ng isang orthophoto nang direkta mula sa kalat-kalat na pagyari. Kung orthophoto lamang ang kailangan, at hindi isang buong 3D na modelo, i-on ang opsyong ito. Mga orthophoto lang ang naaapektohan. Ang mga mas mataas na halaga ay nagreresulta sa mas matalas na sulok, ngunit maaaring makaapekto sa pamamahagi ng kulay at pagkalabo. Gumamit ng mas mababang halaga para sa mga planar area at mas mataas na halaga para sa mga urban area. Ang default na halaga ay mabuti para sa karamihan ng mga sitwasyon. Mga Argumento Awtomatikong i-crop ang mga imahe sa pamamagitan ng paglikha ng isang makinis na buffer sa paligid ng mga hangganan ng dataset, na lumiliit ng "N" na metro. Gamitin ang "0" para hindi paganahin ang pag-crop. Ang average na bilang ng imahe kada submodel. kapag naghihiwalay ng malaking dataset sa mas maliit na submodels, ang mga imahe ay ginugrupo sa clusters. Ang value na ito ay nireregulate ang bilang ng imahe kung saan ang mga cluster ay dapat na may average. Gumawa ng orthophoto overviews gamit ang gdaladdo. Piliin ang mga imemerge sa merge step ng split dataset. By default, lahat ng output ay minemerge nito. Uriin ang mga point cloud output gamit ang isang Simple Morphological Filter. Maaari mong kontrolin ang mga katangian ng opsyong ito sa pamamagitan ng pag-aayos ng mga parametrong ``--dem-*``. Ang map ay nagrereport ng distansiya sa pagitan ng mga cell sa pinakamalapit na NODATA value (bago magkaron ng hole filling). Ito ay magagamit sa pag-isolate ng mga areas na na-fill na. I-control kung ang nagawa na orthophoto ay ang BigTIFF o ang classic TIFF. Ang BigTIFF ay para sa files na mas malaki sa 4GB and data. Tignan ang link para sa specs ng GDAL: https://www.gdal.org/frmt_gtiff.html for more info. Maaaring macontrol ang density ng point cloud sa pamamagitan ng pag-set ng resolusyon ng depthmap images. Ang mas mataas na value ay mas matagal macompute at mas malaking memorya ang mapo-produce ng denser point clouds. Resolusyon ng DSM/DTM sa cm / pixel. Tanggalin ang mga puntos bago bumuo ng DEM. Ang "1" ay walang pagkabulok (buong kalidad). Ang "100" naman ay ~ 99% na pagkabulok ng mga puntos. Kapaki-pakinabang para sa pagpapabilis ng henerasyon. Default: *None* Default: *number of cores* Default: None. Default: ``0.15`` Default: ``0.5`` Default: ``0.6`` Default: ``0`` Default: ``1.0`` Default: ``1.25`` Default: ``100000`` Default: ``16`` Default: ``18.0`` Default: ``1`` Default: ``2.5`` Default: ``2048`` Default: ``3`` Default: ``4`` Default: ``5`` Default: ``640`` Default: ``8000`` Default: ``8`` Default: ``9`` Default: ``DEFLATE`` Default: ``False`` Default: ``IF_SAFER`` Default: ``PATCH_MATCH`` Default: ``all`` Default: ``auto`` Default: ``gauss_clamping`` Default: ``gmi`` Default: ``high`` Default: ``none`` Magdelete ng mabibigat na intermediate files (katulad ng original orthos, dtm, dsm) para magamit ng husto ang disk space habang naitatabi ang mga compressed na bersyon.  Nakakaapekto ito sa abilidad na magrestart ng  ng pipeline mula sa intermediate stage, nagaallow ito ng datasets na magprocess sa machines na walng sapat na space na available. Also, sa mode na ito, ang mga "reports" ay hindi naisusulat sa output 'opensfm' folder. I-discard ang mga points na may hindi siguradong threshold. Makakaapekto lamang ito sa dense reconstruction ng MVE. Ang higher values ay pinapagsawalang bahala ang mga points. Dinidisplay ang bersiyon ng software number at exits. Ang distance threshold sa meters para hanapin ang pre-matching na imahe base sa GPS exif data. I-set pareho sa ``matcher-neighbors`` at ``0`` ito para malagpasan ang pre-matching. I-export ang georeferenced point cloud sa CSV format. I-export ang georeferenced point loud sa LAS format. Sinasala ang cloud point sa pamamagitan ng pag-alis ng mga puntos na lumihis nang higit sa N standard deviation mula sa local mean. Itakda sa "0" upang hindi paganahin ang pag-filter. Pagulit sa lahat ng tasks. Generates Entwine Point Cloud. Ang flag na ito ay automatikong nadadagdag kapag sinimulan ang WebODM at magagamit kapag bumubuo ng tamang directory structure kapag nagpapatakbo ng NodeODM o sa pagimport ng command line para maging WebODM. Mag-generate ng benchmark file sa runtime info. Nag-generate ng poligon sa palligid ng cropping area na nag-cut ng orthophoto sa paligid ng features. ANg poligon na ito ay makakatulong sa pagtatahi ng mossaics na may multiple overlapping orthophotos. Wag pansinin ang Ground Sampling Distance (GSD). Ang GSD ay nagcacap ng pinakamaraming bilang ng imahe at nagreresize ng imahe kung kinakailangan na nagreresulta ng mas mabilis na pagproseso at mas kaunti na memory usage. Bilang ang GSD ay estimate lamang, ang hindi pagbigay pansin dito ay magreresulta ng medyo mas mabuting quality ng imahe. Itago ang mga mukha sa mesh na hindi makikita sa camera. Pinakamababang bilang ng pwede i-extract na imahe. Mas maraming tampok ay magreresulta ng mas magandang resulta ngutin mas mabagal na pagsasakatuparan. Pinakakonti na bilang ng view na dapat magreconstruct sa point para ito ay maging valid. Gumamit ng mas mababang values kung ang imahe ay may mas konti na overlap. Ang mas mababang values ay nagreresulta ng mas dense na point clouds ngunit mas maraming noise. Ito ay nagaapply lamang kung ikaw ay gumagamit ng OpenSfM para sa dense matching. Bilang ng pinakamalapit na imahe na i-prematch base sa GPS exif data. I-set sa ``0`` para malagpasan anf pre-matching. Ang Neighbors ay gumagana sa pamamagitan ng Distance parameter, i-set pareho sa 0 para hindi na gamitin ang pre-matching. Ang OpenSFM ay gumagamit ng parehong parameters ng sabay, Ang Bundler naman ay gumagamit lamang ng isa na may value, mas preferred nito ang Neighbors parameter. Bilang ng mga points kada octree node. Para sa mga low noise, ang value na nasa [1-5] ay magagamit. Para naman sa mas mataas na noise datasets, ang malaking value na nasa [15-20] naman ang magagamit. Bilang ng mga hakbang na ginamit upang punan ang mga lugar ng mga puwang. Itakda sa "0" upang hindi paganahin ang pagpuno ng puwang. Magsimula sa isang radius na katumbas ng resolusyon ng output, N ang bilang ng iba't ibang mga DEM na nabubuo, na may progresibong lumalaki na bilang ng radius gamit ang inverse distance weighted (IDW) na algorithm at pinagsama. Ang mga natitirang puwang ay pinagsasama gamit ang pinakamalapit na interpolation ng kapitbahay. Oct-tree depth used in the mesh reconstruction, increase to get more vertices, recommended values are 8-12. Mga Opsyon at Tanda Mga Opsiyon: ``JPEG`` | ``LZW`` | ``PACKBITS`` | ``DEFLATE`` | ``LZMA`` | ``NONE`` Mga Opsiyon: ``PATCH_MATCH`` | ``PATCH_MATCH_SAMPLE`` | ``BRUTE_FORCE`` Mga Opsiyon: ``YES`` | ``NO`` | ``IF_NEEDED`` | ``IF_SAFER`` Mga Opsiyon: ``area`` | ``gmi`` Mga Opsiyon: ``auto`` | ``perspective`` | ``brown`` | ``fisheye`` | ``spherical`` Opsyon: ``dataset`` | ``split`` | ``merge`` | ``opensfm`` | ``mve`` | ``odm_filterpoints`` | ``odm_meshing`` | ``mvs_texturing`` | ``odm_georeferencing`` | ``odm_dem`` | ``odm_orthophoto`` Mga Opsiyon: ``gamma`` | ``none`` Mga Opsiyon: ``none`` | ``camera`` | ``camera+sun`` Mga Opsiyon: ``none`` | ``gauss_damping`` | ``gauss_clamping`` Mga Opsiyon: ``ultra`` | ``high`` | ``medium`` | ``low`` | ``lowest`` Resolusyon ng orthopoto sa cm/pixel. Kawing patungo sa mga imahe. Ang path na naglalaman ng ground control points gamit sa georeferencing. Ang file ay kailangan ng mga sumusunod na line format: ``easting northing height pixelrow pixelcol imagename`` Kawing patungo sa mga proyekto. Magprint ng karagdagang mensahe sa console. Prodyeksyon na ginagamit sa pagtransform ng model sa mga heyograpikong coordinate. Radius ng overlap sa pagitan ng submodels. Matapos pagsamasamahin ang mga imahe sa isang cluster, ang mga imahe na mas malapit sa cluster ay nadaragdag agad sa cluster. Ito ay nangyayari para siguraduhin na ang magkakalapit na submodel ay magoverlap. Raw depthmap computation algorithm. ``PATCH_MATCH`` at ``PATCH_MATCH_SAMPLE`` ay mas mabilis, ngunit baka maka-miss ng valid points. Ang ``BRUTE_FORCE`` ay mas matagal ngunit nagreresulta ng desnser reconstructions. Mag-run ng local bundle adjustment kada imahe na dinadagdag sa reconstruction at global adjustment kada 100 na imahe. Pinapabilis nito ang reconstruction ng mga malalaking datasets. i-set ang klase ng camera projection. Ang manual na pagaayos ng value ay makakatulong sa pagpapa-improve ng geometric undistortion. By default, ang aplikasyon ay sinusubukan na i-determine ang lens type galing sa image metadata. I-set ang feature extraction quality. Ang mas mataas na quality ay naggegenerate ng mas magandang features, ngunit ang mas kumakain ito ng mas malaking memorya at mas matagal ang proseso. I-set ang compression na gagamitin. Tandaan na maaari nitong ma-break ang gdal_translate kung hindi pamilyar sa iyong ginagawa. Magset ng radiometric calibration na gagamitin sa mga imahe. kapag nagpaprocess ng multispectral images, kailangan na i-set ang opsiyon para maobtain ang reflectance values (kung hindi ay makukuha lamang ang digital number (DN) values). I-set ang parameter na ito kung nais ng stripped geoTIFF. Ipakita ang help message at mag-exit. Simple Morphological Filter elevation scalar parameter. Simple Morphological Filter elevation threshold parameter (meters). Simple Morphological Filter slope parameter (rise over run). Simple Morphological Filter window radius parameter (meters). Lagpasan ang pagpuno ng butas sa mga mesh. Lagpasan ang generation ng full 3d model. Makakatipid ka ng oras kung ang resulta na kailangan mo lang ay 2D tulad ng orthophotos at DEMs. Lagpasan ang geometric visibility test. Lagpasan ang global seam leveling. Magagamit ito sa IR data. Lagpasan ang local seam blending. Ang pinakamalaking bilang ng proseso na gagamitin sa ibat-ibang proseso. Ang peak memory requirement ay ~1GB per thread at 2 megapixel na resolusyon ng imahe. Ang pinakamaraming bilang ng vertex ng output mesh. Tinutukoy ng floating point value ang kahalagahan na ang pag-interpolate ng mga muwestra ng mga punto ay ibinigay sa pagbabalangkas ng na-screen na Poisson equation. Ang mga resulta ng orihinal (unscreened) Poisson Reconstruction ay maaaring makuha sa pamamagitan ng pagtatakda ng halagang ito sa "0". Patayin ang camera paremeter optimization habang ginagamit ang blunder. Off ang default maliban kung ``--camera`` parameter ang gamit. I-turn on ang gamma tone mapping o wag para sa no tone mapping. Klase ng photometric outlier removal method. URL to a ClusterODM instance for distributing a split-merge workflow on multiple nodes in parallel. Gumamit ng full 3d mesh upang macompute ang orthophoto kesa sa 2.5D mesh. Ang opsyon na ito ay mas mabilis at nagbibigay ng resulta sa planar areas. Buksan ang opensfm para macompute ang dense point cloud alternatively. Gamitin ang tag na ito kung mayroong gcp_list.txt ngunit gustong gumamit ng exit geotags. Gamitin ang tag na ito para bumuo ng DSM (Digital Surface Model, ground + objects) gamit ang PROGRESIBONG morphological filter. I-check ang ``--dem*`` na parameters para sa mas-finer na tuning. Gamitin ang tag na ito para bumuo ng DTM (Digital Terrain Model, ground only) gamit ang simpleng morphological filter. I-check ang ``--dem*`` at ``--smrf*`` na parameters para sa mas-finer na tuning. Kapag gumagamit ng ``PATCH_MATCH`` o ``PATCH_MATCH_SAMPLE``, ang nagcocontrol ng standard deviation threshold para maisama ang mga patches. Ang mga patches na may mas mababang standard deviation ay ini-ignore. Ang [``camera+sun``] ay experiemental, inaapply lahat ng correction ng [``camera``] at dinadagdagan ng spectral radiance na registered via a downdwelling light sensor (DLS) na pinagsasaalang-alang ang anggulo ng araw. [``camera``] ay nagaapply ng black level, vignetting, row gradient gain/exposure compensation (kung sapat na EXIF tags ang mayroon). 