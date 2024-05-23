.. Flowchart with options

Flowchart with options
=======================

.. mermaid::

    %%{init: {'theme':'neutral','flowchart': { 'curve': 'bumpX' ,"defaultRenderer": "elk"}}}%%


    %% Style de curve bumpX

    graph LR

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



    subgraph Split["`**Split**`"]
        sm_cluster:::options
        sm_no_align:::options
        split:::options
        split_image_groups:::options
        split_overlap:::options
    end

    subgraph OpenSFM["`**OpenSFM**`"]
        feature_quality:::options
        feature_type:::options
        force_gps:::options
        ignore_gsd:::options
        matcher-neighbors:::options
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

    subgraph openmvs["`**openmvs**`"]
        pc_filter:::options
        pc_skip_geometric:::options
    end

    subgraph odm_filterpoints["`**odm_filterpoints**`"]
        auto_boundary:::options
        auto_boundary_distance:::options
        boundary:::options
        fast_orthophoto:::options
        pc_sample:::options
    end

    subgraph odm_meshing["`**odm_meshing**`"]
        mesh_octree_depth:::options
        mesh_size:::options
        skip_3dmodel:::options
    end

    subgraph mvs_texturing["`**mvs_texturing**`"]
        gltf:::options
        texturing_keep_unseen_faces:::options
        texturing_single_material:::options
        texturing_skip_global_seam_leveling:::options
        use_3dmesh:::options
    end


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

    subgraph odm_report["`**odm_report**`"]
        skip-report:::options
    end

    subgraph odm_postprocess["`**odm_postprocess**`"]
        3d-tiles:::options
        copy_to:::options
    end

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
    classDef options stroke-width:4px,stroke-dasharray: 5,fill:#b0e760

    %% Style for stages
    classDef stages fill:#f96,stroke:#333,stroke-width:4px;


    style images fill:#f9f,stroke:#333,stroke-width:4px


