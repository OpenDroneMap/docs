.. Flowchart with options

Flowchart with options
=======================

.. mermaid::
   :zoom:

    flowchart  TB

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Subgraph Stages
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        subgraph dataset-stage["`**dataset-stage**`"]
            bg-removal:::options
            camera-lens:::options
            cameras:::options
            gcp:::options
            geo:::options
            gps-accuracy:::options
            primary-band:::options
            sky-removal:::options
            use-exif:::options
            video-limit:::options
            video-resolution:::options
        end
        bg-removal ~~~ camera-lens ~~~ cameras  ~~~ gcp ~~~  geo
        gps-accuracy ~~~ primary-band ~~~ sky-removal ~~~   use-exif  ~~~ video-limit

    click bg-removal "../arguments/bg-removal/"
    click camera-lens "../arguments/camera-lens/"
    click cameras "../arguments/cameras/"
    click gcp "../arguments/gcp/"
    click geo "../arguments/geo/"
    click gps-accuracy "../arguments/gps-accuracy/"
    click primary-band "../arguments/primary-band/"
    click sky-removal "../arguments/sky-removal/"
    click use-exif "../arguments/use-exif/"
    click video-limit "../arguments/video-limit/"
    click video-resolution "../arguments/video-resolution/"


        subgraph Split["`**Split**`"]
            direction TB
            sm-cluster:::options
            sm-no-align:::options
            split:::options
            split-image-groups:::options
            split-overlap:::options
        end
    click sm-cluster "../arguments/sm-cluster/"
    click sm-no-align "../arguments/sm-no-align/"
    click split "../arguments/split/"
    click split-image-groups "../arguments/split-image-groups/"
    click split-overlap "../arguments/split-overlap/"

        Spliting

        subgraph OpenSFM["`**OpenSFM**`"]
            feature-quality:::options
            feature-type:::options
            force-gps:::options
            ignore-gsd:::options
            matcher-neighbors:::options
            matcher-order:::options
            matcher-type:::options
            min-num-features:::options
            pc-quality:::options
            radiometric-calibration:::options
            rolling-shutter:::options
            rolling-shutter-readout:::options
            sfm-algorithm:::options
            sfm-no-partial:::options
            skip-band-alignment:::options
            use-fixed-camera-params:::options
            use-hybrid-bundle-adjustment:::options
        end
        feature-quality ~~~  feature-type ~~~ force-gps ~~~ ignore-gsd ~~~ matcher-neighbors
        matcher-order ~~~ matcher-type ~~~  min-num-features ~~~ pc-quality ~~~ radiometric-calibration
        rolling-shutter  ~~~ rolling-shutter-readout ~~~ sfm-algorithm ~~~ sfm-no-partial ~~~  skip-band-alignment
        use-fixed-camera-params ~~~    use-hybrid-bundle-adjustment

    click feature-quality "../arguments/feature-quality/"
    click feature-type "../arguments/feature-type/"
    click force-gps "../arguments/force-gps/"
    click ignore-gsd "../arguments/ignore-gsd/"
    click matcher-neighbors "../arguments/matcher-neighbors/"
    click matcher-order "../arguments/matcher-order/"
    click matcher-type "../arguments/matcher-type/"
    click min-num-features "../arguments/min-num-features/"
    click pc-quality "../arguments/pc-quality/"
    click radiometric-calibration "../arguments/radiometric-calibration/"
    click rolling-shutter "../arguments/rolling-shutter/"
    click rolling-shutter-readout "../arguments/rolling-shutter-readout/"
    click sfm-algorithm "../arguments/sfm-algorithm/"
    click sfm-no-partial "../arguments/sfm-no-partial/"
    click skip-band-alignment "../arguments/skip-band-alignment/"
    click use-fixed-camera-params "../arguments/use-fixed-camera-params/"
    click use-hybrid-bundle-adjustment "../arguments/use-hybrid-bundle-adjustment/"


        subgraph openmvs["`**openmvs**`"]
            pc-filter:::options
            pc-skip-geometric:::options
        end
        pc-filter ~~~ pc-skip-geometric

    click pc-filter "../arguments/pc-filter/"
    click pc-skip-geometric "../arguments/pc-skip-geometric/"

        subgraph odm-filterpoints["`**odm-filterpoints**`"]
            auto-boundary:::options
            auto-boundary-distance:::options
            boundary:::options
            fast-orthophoto:::options
            pc-sample:::options
        end
        auto-boundary ~~~ auto-boundary-distance  ~~~ boundary  ~~~  fast-orthophoto ~~~  pc-sample

    click auto-boundary "../arguments/auto-boundary/"
    click auto-boundary-distance "../arguments/auto-boundary-distance/"
    click boundary "../arguments/boundary/"
    click fast-orthophoto "../arguments/fast-orthophoto/"
    click pc-sample "../arguments/pc-sample/"

        subgraph odm-meshing["`**odm-meshing**`"]
            mesh-octree-depth:::options
            mesh-size:::options
            skip-3dmodel:::options
        end
        mesh-octree-depth ~~~ mesh-size ~~~ skip-3dmodel

    click mesh-octree-depth "../arguments/mesh-octree-depth/"
    click mesh-size "../arguments/mesh-size/"
    click skip-3dmodel "../arguments/skip-3dmodel/"

        subgraph mvs-texturing["`**mvs-texturing**`"]
            gltf:::options
            texturing-keep-unseen-faces:::options
            texturing-single-material:::options
            texturing-skip-global-seam-leveling:::options
            use-3dmesh:::options
        end
        gltf ~~~ texturing-keep-unseen-faces ~~~ texturing-single-material  ~~~ texturing-skip-global-seam-leveling ~~~  use-3dmesh

    click gltf "../arguments/gltf/"
    click texturing-keep-unseen-faces "../arguments/texturing-keep-unseen-faces/"
    click texturing-single-material "../arguments/texturing-single-material/"
    click texturing-skip-global-seam-leveling "../arguments/texturing-skip-global-seam-leveling/"
    click use-3dmesh "../arguments/use-3dmesh/"

        subgraph odm-georeferencing["`**odm-georeferencing**`"]
            align:::options
            crop:::options
            pc-classify:::options
            pc-copc:::options
            pc-csv:::options
            pc-ept:::options
            pc-las:::options
            pc-rectify:::options
        end
        align ~~~ crop ~~~ pc-classify ~~~ pc-copc ~~~ pc-csv
        pc-ept ~~~ pc-las ~~~ pc-rectify

    click align "../arguments/align/"
    click crop "../arguments/crop/"
    click pc-classify "../arguments/pc-classify/"
    click pc-copc "../arguments/pc-copc/"
    click pc-csv "../arguments/pc-csv/"
    click pc-ept "../arguments/pc-ept/"
    click pc-las "../arguments/pc-las/"
    click pc-rectify "../arguments/pc-rectify/"

        subgraph odm-dem["`**odm-dem**`"]
            cog:::options
            dem-decimation:::options
            dem-euclidean-map:::options
            dem-gapfill-steps:::options
            dem-resolution:::options
            dsm:::options
            dtm:::options
            smrf-scalar:::options
            smrf-slope:::options
            smrf-threshold:::options
            smrf-window:::options
            tiles:::options
        end
        cog ~~~ dem-decimation  ~~~ dem-euclidean-map  ~~~ dem-gapfill-steps  ~~~  dem-resolution
        dsm  ~~~ dtm  ~~~    smrf-scalar ~~~ smrf-slope   ~~~ smrf-threshold   ~~~ smrf-window

    click cog "../arguments/cog/"
    click dem-decimation "../arguments/dem-decimation/"
    click dem-euclidean-map "../arguments/dem-euclidean-map/"
    click dem-gapfill-steps "../arguments/dem-gapfill-steps/"
    click dem-resolution "../arguments/dem-resolution/"
    click dsm "../arguments/dsm/"
    click dtm "../arguments/dtm/"
    click smrf-scalar "../arguments/smrf-scalar/"
    click smrf-slope "../arguments/smrf-slope/"
    click smrf-threshold "../arguments/smrf-threshold/"
    click smrf-window "../arguments/smrf-window/"

        subgraph odm-orthophoto["`**odm-orthophoto**`"]
            build-overviews:::options
            orthophoto-compression:::options
            orthophoto-cutline:::options
            orthophoto-kmz:::options
            orthophoto-no-tiled:::options
            orthophoto-png:::options
            orthophoto-resolution:::options
            skip-orthophoto:::options
        end
        build-overviews ~~~ orthophoto-compression  ~~~ orthophoto-cutline  ~~~ orthophoto-kmz
        orthophoto-no-tiled ~~~ orthophoto-png  ~~~ orthophoto-resolution ~~~ skip-orthophoto

    click build-overviews "../arguments/build-overviews/"
    click orthophoto-compression "../arguments/orthophoto-compression/"
    click orthophoto-cutline "../arguments/orthophoto-cutline/"
    click orthophoto-kmz "../arguments/orthophoto-kmz/"
    click orthophoto-no-tiled "../arguments/orthophoto-no-tiled/"
    click orthophoto-png "../arguments/orthophoto-png/"
    click orthophoto-resolution "../arguments/orthophoto-resolution/"
    click skip-orthophoto "../arguments/skip-orthophoto/"

        subgraph odm-report["`**odm-report**`"]
            skip-report:::options
        end

    click skip-report "../arguments/skip-report/"

        subgraph odm-postprocess["`**odm-postprocess**`"]
            3d-tiles:::options
            copy-to:::options
        end
        3d-tiles ~~~ copy-to

    click 3d-tiles "../arguments/3d-tiles/"
    click copy-to "../arguments/copy-to/"

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Links
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        images--> dataset-stage --> Split -- No --> OpenSFM --> openmvs
        openmvs --> odm-filterpoints --> odm-meshing --> mvs-texturing --> odm-georeferencing
        odm-georeferencing --> odm-dem --> odm-orthophoto --> odm-report --> odm-postprocess

        %% Split yes
        %%Split -- Yes ----> Spliting -- Merge ----> OpenSFM-detect-features
        Split -- Yes --> Spliting --> OpenSFM

        %% Styles

        %% Style for options
        classDef options stroke-width:4px,stroke-dasharray: 5,fill:#ecc4a5

        %% Style for stages
        classDef stages fill:#11b7aa,rx:10,ry:10
        class dataset-stage,Split,OpenSFM,openmvs,odm-filterpoints stages
        class odm-meshing,mvs-texturing,odm-georeferencing,odm-dem stages
        class odm-orthophoto,odm-report,odm-postprocess,Spliting stages

        classDef imagesstyle fill:#b0e760,rx:10,ry:10
        class images imagesstyle
