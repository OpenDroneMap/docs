.. Flowchart with options

Flowchart with options
=======================

.. mermaid::

    flowchart  TB

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Subgraph Stages
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        subgraph dataset_stage["`**dataset_stage**`"]
            bg_removal:::options
            camera-lens:::options
            cameras:::options
            gcp:::options
            geo:::options
            gps_accuracy:::options
            primary_band:::options
            sky_removal:::options
            use_exif:::options
            video_limit:::options
            video_resolution:::options
        end
        bg_removal ~~~ camera-lens ~~~ cameras  ~~~ gcp ~~~  geo
        gps_accuracy ~~~ primary_band ~~~ sky_removal ~~~   use_exif  ~~~ video_limit



        subgraph Split["`**Split**`"]
            direction TB
            sm_cluster:::options
            sm_no_align:::options
            split:::options
            split_image_groups:::options
            split_overlap:::options
        end

        Spliting

        subgraph OpenSFM["`**OpenSFM**`"]
            feature_quality:::options
            feature_type:::options
            force_gps:::options
            ignore_gsd:::options
            matcher_neighbors:::options
            matcher_order:::options
            matcher_type:::options
            min_num_features:::options
            pc_quality:::options
            radiometric_calibration:::options
            rolling_shutter:::options
            rolling_shutter_readout:::options
            sfm-algorithm:::options
            sfm_no_partial:::options
            skip_band_alignment:::options
            use_fixed_camera_params:::options
            use_hybrid_bundle_adjustment:::options
        end
        feature_quality ~~~  feature_type ~~~ force_gps ~~~ ignore_gsd ~~~ matcher_neighbors
        matcher_order ~~~ matcher_type ~~~  min_num_features ~~~ pc_quality ~~~ radiometric_calibration
        rolling_shutter  ~~~ rolling_shutter_readout ~~~ sfm-algorithm ~~~ sfm_no_partial ~~~  skip_band_alignment
        use_fixed_camera_params ~~~    use_hybrid_bundle_adjustment


        subgraph openmvs["`**openmvs**`"]
            pc_filter:::options
            pc_skip_geometric:::options
        end
        pc_filter ~~~ pc_skip_geometric

        subgraph odm_filterpoints["`**odm_filterpoints**`"]
            auto_boundary:::options
            auto_boundary_distance:::options
            boundary:::options
            fast_orthophoto:::options
            pc_sample:::options
        end
        auto_boundary ~~~ auto_boundary_distance  ~~~ boundary  ~~~  fast_orthophoto ~~~  pc_sample

        subgraph odm_meshing["`**odm_meshing**`"]
            mesh_octree_depth:::options
            mesh_size:::options
            skip_3dmodel:::options
        end
        mesh_octree_depth ~~~ mesh_size ~~~ skip_3dmodel

        subgraph mvs_texturing["`**mvs_texturing**`"]
            gltf:::options
            texturing_keep_unseen_faces:::options
            texturing_single_material:::options
            texturing_skip_global_seam_leveling:::options
            use_3dmesh:::options
        end
        gltf ~~~ texturing_keep_unseen_faces ~~~ texturing_single_material  ~~~ texturing_skip_global_seam_leveling ~~~  use_3dmesh

        subgraph odm_georeferencing["`**odm_georeferencing**`"]
            align:::options
            crop:::options
            pc_classify:::options
            pc_copc:::options
            pc_csv:::options
            pc_ept:::options
            pc_las:::options
            pc_rectify:::options
        end
        align ~~~ crop ~~~ pc_classify ~~~ pc_copc ~~~ pc_csv
        pc_ept ~~~ pc_las ~~~ pc_rectify

        subgraph odm_dem["`**odm_dem**`"]
            cog:::options
            dem_decimation:::options
            dem_euclidean_map:::options
            dem_gapfill_steps:::options
            dem_resolution:::options
            dsm:::options
            dtm:::options
            smrf_scalar:::options
            smrf_slope:::options
            smrf_threshold:::options
            smrf_window:::options
            tiles:::options
        end
        cog ~~~ dem_decimation  ~~~ dem_euclidean_map  ~~~ dem_gapfill_steps  ~~~  dem_resolution
        dsm  ~~~ dtm  ~~~    smrf_scalar ~~~ smrf_slope   ~~~ smrf_threshold   ~~~ smrf_window

        subgraph odm_orthophoto["`**odm_orthophoto**`"]
            build_overviews:::options
            orthophoto_compression:::options
            orthophoto_cutline:::options
            orthophoto_kmz:::options
            orthophoto_no_tiled:::options
            orthophoto_png:::options
            orthophoto_resolution:::options
            skip_orthophoto:::options
        end
        build_overviews ~~~ orthophoto_compression  ~~~ orthophoto_cutline  ~~~ orthophoto_kmz
        orthophoto_no_tiled ~~~ orthophoto_png  ~~~ orthophoto_resolution ~~~ skip_orthophoto

        subgraph odm_report["`**odm_report**`"]
            skip-report:::options
        end

        subgraph odm_postprocess["`**odm_postprocess**`"]
            3d-tiles:::options
            copy_to:::options
        end
        3d-tiles ~~~ copy_to

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Links
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        images--> dataset_stage --> Split -- No --> OpenSFM --> openmvs
        openmvs --> odm_filterpoints --> odm_meshing --> mvs_texturing --> odm_georeferencing
        odm_georeferencing --> odm_dem --> odm_orthophoto --> odm_report --> odm_postprocess

        %% Split yes
        %%Split -- Yes ----> Spliting -- Merge ----> OpenSFM_detect_features
        Split -- Yes --> Spliting --> OpenSFM

        %% Styles

        %% Style for options
        classDef options stroke-width:4px,stroke-dasharray: 5,fill:#ecc4a5

        %% Style for stages
        classDef stages fill:#5dbae8,rx:10,ry:10
        class dataset_stage,Split,OpenSFM,openmvs,odm_filterpoints stages
        class odm_meshing,mvs_texturing,odm_georeferencing,odm_dem stages
        class odm_orthophoto,odm_report,odm_postprocess stages

        classDef splitingstyle fill:#5dbae8,rx:10,ry:10
        class Spliting splitingstyle

        classDef imagesstyle fill:#b0e760,rx:10,ry:10
        class images imagesstyle
