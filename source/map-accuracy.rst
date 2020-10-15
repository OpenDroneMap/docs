############
Map accuracy
############

Accuracy can be defined as the degree or closeness to which the information on a map matches the values in the real world. Therefore, when we refer to accuracy, we are talking about quality of data and about number of errors contained in a certain dataset (Pascual 2011). 


**Relative or Local accuracy**

Local or relative accuracy can be defined as the degree to which de distances between two points on a map correspond to the actually distances between those points in the real world. 

Relative accuracy is independent of the location of the map in the world, so a map can have a high relative accuracy (in size and shape) but its position in the world can be shifted (Figure 1). 

.. figure:: images/rel_accuracy.png
   :alt: Model showing high relative accuracy
   :align: center
   
*Figure 1. Model showing high relative accuracy but misplaced according to its real world position*



**Absolute or global Accuracy** 

Absolute accuracy is the accuracy of the reconstruction in relation to its true position on the planet (Pix4D 2019). Figure 2 shows a relative and absolute accurate model, as the points are correctly placed according to its real world position. 

.. figure:: images/abs_accuracy.png
   :alt: Model showing high absolute accuracy
   :align: center

*Figure 2. Model showing high relative and absolute accuracy. Placed correctly according to its real world position*


**An Accuracy level for each project**

Each project has specific accuracy needs to be met. For instance assessing the progress in a construction site or measuring an area affected by a fire does not require the use of GCP, since absolute accuracy will not impact the decision making process. In the other hand, there are tasks on which accuracy is critical, for example project compliance evaluations and land title surveying, which require a higher relative and absolute accuracy. 

**************
What to expect 
**************

In general terms, one can expect the relative accuracy to be in the order of 1 to 3 times the average GSD for the dataset. And as for the absolute accuracy, one must consider that it is dependent of the GPS unit mounted in the UAV but the horizontal accuracy of a standard GPS is usually in the range of 2 to 6 meters and the vertical accuracy between 3 to 4 times the horizontal accuracy. 

When using GCP, absolute accuracy can be improved to 2.5 times GSD for the horizontal accuracy and 4 times the GSD for the vertical accuracy (Madawalagama 2016). 

At a GSD of 1cm, the accuracy is to that of the RTK GNSS, and is within 1:200 scales according to NSDI & FGDC mapping accuracy standards during sub-optimal conditions (Barry 2013). 

------------------------------
Aspects impacting map accuracy 
------------------------------

**Weather**

Weather conditions have direct impact in the photogrammetry results, so it is important to consider cloud coverage, wind speed, humidity, sun’s altitude and other factors influencing the UAV stability and terrain illumination. 

**Cameras**

Bigger and better sensors produce less noise and more clearly focused images. Also consider that rolling shutter cameras produce distorted images when the UAV is moving, so global or mechanical shutter cameras are advised for mapping jobs. 


**Flight altitude**

The higher the flight altitude, the larger the image footprint and GSD. The resulting larger GSD the accuracy will be decreased as there will be less detail in the recognizable features. When a smaller GSD is required an altitude of 3 to 4 times the height of the highest point is recommended. 


**Flight speed**

Flight speed have special effect in cameras equipped with rolling shutter, while those equipped with global or mechanical shutter tends to reduce this effect. UAV equipped with RTK positioning systems are also affected with the speed, but with hover at each photo taken, you can get very good accuracy. If instead you are moving during each photo take, the accuracy is going to be limited by two factors: the speed at which you are moving multiplied by the 1 second increments of RTK (Mather 2020). 


**********
References
**********

Barry, P., & Coakley, R. «Accuracy of UAV photogrammetry compared with Network RTK GPS.» Baseline Surveys. 2013. http://uav.ie/PDF/Accuracy_UAV_compare_RTK_GPS.pdf  (accessed 10 13, 2020). 

Drone Deploy. How Do I Use Ground Control Points?: A guide to using ground control points with drone mapping software. 5 8, 2017. https://www.dronedeploy.com/blog/what-are-ground-control-points-gcps/ (accessed 7 9, 2020). 

Madawalagama, S.L., Munasinghe, N., Dampegama, S.D.P.J. and Samarakoon, L. «Low-cost aerial mapping with consumer grade.» 37th Asian Conference on Remote Sensing. Colombo, Sri Lanka, 2016. 

Mather, Stephen. OpenDroneMap. 30 de Marzo de 2020. https://community.opendronemap.org/t/the-accuracy-of-webodm-using-rtk-uavs/3937 (accessed 10 12, 2020). 

Pascual, Manuel S. GIS Lounge: GIS Data: A Look at Accuracy, Precision, and Types of Errors. 11 6, 2011. https://www.gislounge.com/gis-data-a-look-at-accuracy-precision-and-types-of-errors/ (accessed 07 09, 2020). 

Pix4D. «What is accuracy in an aerial mapping project?» Pix4D. 25 de 05 de 2019. https://www.pix4d.com/blog/accuracy-aerial-mapping (accessed 10 13, 2020). 


`Help edit these docs! <https://github.com/OpenDroneMap/docs/blob/publish/source/tutorials.rst>`_
