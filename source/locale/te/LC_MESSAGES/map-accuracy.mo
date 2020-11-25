��    !      $              ,     -  &   M     t     �     �     �     �  c   �  t   4  �   �    �     �  �   �  �   �  �   A  �   1  �  	  �  �
  �  �  �   C  �   �     �  �   �  �   b  �   8  
   �  �   �  %  �  �   �     �  �   �  a   _  �  �  Z   �  s   �     X  %   w  "   �  ]   �       (  =  B  f  �  �  �  E  y   /!  �  �!  �  G#  9  �$  4  (  q  L*  	  �.  �  �3  j  �7  �  �8  1   �:  �   ;  �  �;  >  �=  !   �>  8  �>  �  #A  y  �C     4F  �  TF  �   H   **Absolute or global Accuracy** **An Accuracy level for each project** **Cameras** **Flight altitude** **Flight speed** **Relative or Local accuracy** **Weather** *Figure 1. Model showing high relative accuracy but misplaced according to its real world position* *Figure 2. Model showing high relative and absolute accuracy. Placed correctly according to its real world position* Absolute accuracy is the accuracy of the reconstruction in relation to its true position on the planet (Pix4D 2019). Figure 2 shows a relative and absolute accurate model, as the points are correctly placed according to its real world position. Accuracy can be defined as the degree or closeness to which the information on a map matches the values in the real world. Therefore, when we refer to accuracy, we are talking about quality of data and about number of errors contained in a certain dataset (Pascual 2011). Aspects impacting map accuracy At a GSD of 1cm, the accuracy is to that of the RTK GNSS, and is within 1:200 scales according to NSDI & FGDC mapping accuracy standards during sub-optimal conditions (Barry 2013). Barry, P., & Coakley, R. «Accuracy of UAV photogrammetry compared with Network RTK GPS.» Baseline Surveys. 2013. http://uav.ie/PDF/Accuracy_UAV_compare_RTK_GPS.pdf  (accessed 10 13, 2020). Bigger and better sensors produce less noise and more clearly focused images. Also consider that rolling shutter cameras produce distorted images when the UAV is moving, so global or mechanical shutter cameras are advised for mapping jobs. Drone Deploy. How Do I Use Ground Control Points?: A guide to using ground control points with drone mapping software. 5 8, 2017. https://www.dronedeploy.com/blog/what-are-ground-control-points-gcps/ (accessed 7 9, 2020). Each project has specific accuracy needs to be met. For instance assessing the progress in a construction site or measuring an area affected by a fire does not require the use of GCP, since absolute accuracy will not impact the decision making process. In the other hand, there are tasks on which accuracy is critical, for example project compliance evaluations and land title surveying, which require a higher relative and absolute accuracy. Flight speed have special effect in cameras equipped with rolling shutter, while those equipped with global or mechanical shutter tends to reduce this effect. UAV equipped with RTK positioning systems are also affected with the speed, but with hover at each photo taken, you can get very good accuracy. If instead you are moving during each photo take, the accuracy is going to be limited by two factors: the speed at which you are moving multiplied by the 1 second increments of RTK (Mather 2020). In general terms, one can expect the relative accuracy to be in the order of 1 to 3 times the average GSD for the dataset. And as for the absolute accuracy, one must consider that it is dependent of the GPS unit mounted in the UAV but the horizontal accuracy of a standard GPS is usually in the range of 2 to 6 meters and the vertical accuracy between 3 to 4 times the horizontal accuracy. Local or relative accuracy can be defined as the degree to which de distances between two points on a map correspond to the actually distances between those points in the real world. Madawalagama, S.L., Munasinghe, N., Dampegama, S.D.P.J. and Samarakoon, L. «Low-cost aerial mapping with consumer grade.» 37th Asian Conference on Remote Sensing. Colombo, Sri Lanka, 2016. Map accuracy Mather, Stephen. OpenDroneMap. 30 de Marzo de 2020. https://community.opendronemap.org/t/the-accuracy-of-webodm-using-rtk-uavs/3937 (accessed 10 12, 2020). Pascual, Manuel S. GIS Lounge: GIS Data: A Look at Accuracy, Precision, and Types of Errors. 11 6, 2011. https://www.gislounge.com/gis-data-a-look-at-accuracy-precision-and-types-of-errors/ (accessed 07 09, 2020). Pix4D. «What is accuracy in an aerial mapping project?» Pix4D. 25 de 05 de 2019. https://www.pix4d.com/blog/accuracy-aerial-mapping (accessed 10 13, 2020). References Relative accuracy is independent of the location of the map in the world, so a map can have a high relative accuracy (in size and shape) but its position in the world can be shifted (Figure 1). The higher the flight altitude, the larger the image footprint and GSD. The resulting larger GSD the accuracy will be decreased as there will be less detail in the recognizable features. When a smaller GSD is required an altitude of 3 to 4 times the height of the highest point is recommended. Weather conditions have direct impact in the photogrammetry results, so it is important to consider cloud coverage, wind speed, humidity, sun’s altitude and other factors influencing the UAV stability and terrain illumination. What to expect When using GCP, absolute accuracy can be improved to 2.5 times GSD for the horizontal accuracy and 4 times the GSD for the vertical accuracy (Madawalagama 2016). `Help edit these docs! <https://github.com/OpenDroneMap/docs/blob/publish/source/tutorials.rst>`_ Project-Id-Version: OpenDroneMap 2.0.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-10-26 14:39-0400
PO-Revision-Date: 2020-10-15 13:38+0000
Last-Translator: danbjoseph <danbjoseph@gmail.com>, 2020
Language: te
Language-Team: Telugu (https://www.transifex.com/americanredcross/teams/111882/te/)
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 ** సంపూర్ణ లేదా ప్రపంచ ఖచ్చితత్వం ** ** ప్రతి ప్రాజెక్ట్ కోసం ఖచ్చితత్వం స్థాయి ** ** కెమెరాలు ** ** విమాన ఎత్తు ** ** విమాన వేగం ** ** సాపేక్ష లేదా స్థానిక ఖచ్చితత్వం ** ** వాతావరణం ** * మూర్తి 1. అధిక సాపేక్ష ఖచ్చితత్వాన్ని చూపించే మోడల్ కానీ దాని వాస్తవ ప్రపంచ స్థానం ప్రకారం తప్పుగా ఉంచబడింది * * మూర్తి 2. అధిక సాపేక్ష మరియు సంపూర్ణ ఖచ్చితత్వాన్ని చూపించే మోడల్. దాని వాస్తవ ప్రపంచ స్థానం ప్రకారం సరిగ్గా ఉంచబడింది * సంపూర్ణ ఖచ్చితత్వం అంటే గ్రహం మీద దాని నిజమైన స్థానానికి సంబంధించి పునర్నిర్మాణం యొక్క ఖచ్చితత్వం (పిక్స్ 4 డి 2019). మూర్తి 2 సాపేక్ష మరియు సంపూర్ణ ఖచ్చితమైన నమూనాను చూపిస్తుంది, ఎందుకంటే పాయింట్లు దాని వాస్తవ ప్రపంచ స్థానం ప్రకారం సరిగ్గా ఉంచబడతాయి. మ్యాప్‌లోని సమాచారం వాస్తవ ప్రపంచంలోని విలువలతో సరిపోయే డిగ్రీ లేదా సాన్నిహిత్యాన్ని ఖచ్చితత్వాన్ని నిర్వచించవచ్చు. అందువల్ల, మేము ఖచ్చితత్వాన్ని సూచించినప్పుడు, మేము డేటా నాణ్యత గురించి మరియు ఒక నిర్దిష్ట డేటాసెట్ (పాస్కల్ 2011) లో ఉన్న లోపాల సంఖ్య గురించి మాట్లాడుతున్నాము. మ్యాప్ ఖచ్చితత్వాన్ని ప్రభావితం చేసే అంశాలు 1 సెం.మీ. యొక్క GSD వద్ద, ఖచ్చితత్వం RTK GNSS కు ఉంటుంది మరియు ఇది ఉప-ఆప్టిమల్ పరిస్థితులలో (బారీ 2013) NSDI & FGDC మ్యాపింగ్ ఖచ్చితత్వ ప్రమాణాల ప్రకారం 1: 200 ప్రమాణాలలో ఉంటుంది. బారీ, పి., & కోక్లీ, ఆర్. Network నెట్‌వర్క్ RTK GPS తో పోలిస్తే UAV ఫోటోగ్రామెట్రీ యొక్క ఖచ్చితత్వం. » బేస్లైన్ సర్వేలు. 2013. http://uav.ie/PDF/Accuracy_UAV_compare_RTK_GPS.pdf (10 13, 2020 న వినియోగించబడింది). పెద్ద మరియు మంచి సెన్సార్లు తక్కువ శబ్దం మరియు స్పష్టంగా దృష్టి కేంద్రీకరించిన చిత్రాలను ఉత్పత్తి చేస్తాయి. యుఎవి కదులుతున్నప్పుడు రోలింగ్ షట్టర్ కెమెరాలు వక్రీకరించిన చిత్రాలను ఉత్పత్తి చేస్తాయని కూడా పరిగణించండి, కాబట్టి మ్యాపింగ్ ఉద్యోగాల కోసం గ్లోబల్ లేదా మెకానికల్ షట్టర్ కెమెరాలు సూచించబడతాయి. డ్రోన్ డిప్లాయ్. నేను గ్రౌండ్ కంట్రోల్ పాయింట్లను ఎలా ఉపయోగించగలను ?: డ్రోన్ మ్యాపింగ్ సాఫ్ట్‌వేర్‌తో గ్రౌండ్ కంట్రోల్ పాయింట్లను ఉపయోగించటానికి ఒక గైడ్. 5 8, 2017. https://www.dronedeploy.com/blog/what-are-ground-control-points-gcps/ (యాక్సెస్ చేయబడింది 7 9, 2020). ప్రతి ప్రాజెక్ట్ నిర్దిష్ట ఖచ్చితత్వాన్ని కలిగి ఉండాలి. ఉదాహరణకు, నిర్మాణ స్థలంలో పురోగతిని అంచనా వేయడం లేదా అగ్నిప్రమాదం సంభవించిన ప్రాంతాన్ని కొలవడం GCP యొక్క ఉపయోగం అవసరం లేదు, ఎందుకంటే సంపూర్ణ ఖచ్చితత్వం నిర్ణయం తీసుకునే ప్రక్రియను ప్రభావితం చేయదు. మరోవైపు, ఖచ్చితత్వం కీలకమైన పనులు ఉన్నాయి, ఉదాహరణకు ప్రాజెక్ట్ వర్తింపు మూల్యాంకనాలు మరియు భూమి టైటిల్ సర్వేయింగ్, దీనికి అధిక సాపేక్ష మరియు సంపూర్ణ ఖచ్చితత్వం అవసరం. రోలింగ్ షట్టర్ అమర్చిన కెమెరాల్లో విమాన వేగం ప్రత్యేక ప్రభావాన్ని చూపుతుంది, అయితే గ్లోబల్ లేదా మెకానికల్ షట్టర్ అమర్చినవి ఈ ప్రభావాన్ని తగ్గిస్తాయి. RTK పొజిషనింగ్ సిస్టమ్‌లతో కూడిన UAV కూడా వేగంతో ప్రభావితమవుతుంది, కానీ తీసిన ప్రతి ఫోటో వద్ద హోవర్‌తో, మీరు చాలా మంచి ఖచ్చితత్వాన్ని పొందవచ్చు. బదులుగా మీరు ప్రతి ఫోటో తీసేటప్పుడు కదులుతున్నట్లయితే, ఖచ్చితత్వం రెండు కారకాల ద్వారా పరిమితం చేయబడుతుంది: మీరు కదులుతున్న వేగం RTK (మాథర్ 2020) యొక్క 1 సెకండ్ ఇంక్రిమెంట్లతో గుణించబడుతుంది. సాధారణ పరంగా, డేటాసెట్ కోసం సగటు ఖచ్చితత్వం 1 నుండి 3 రెట్లు సాపేక్ష ఖచ్చితత్వం ఉంటుందని ఎవరైనా ఆశించవచ్చు. మరియు సంపూర్ణ ఖచ్చితత్వానికి, ఇది UAV లో అమర్చిన GPS యూనిట్ మీద ఆధారపడి ఉంటుందని పరిగణించాలి కాని ప్రామాణిక GPS యొక్క క్షితిజ సమాంతర ఖచ్చితత్వం సాధారణంగా 2 నుండి 6 మీటర్ల పరిధిలో ఉంటుంది మరియు నిలువు ఖచ్చితత్వం 3 నుండి 4 రెట్లు మధ్య ఉంటుంది సమాంతర ఖచ్చితత్వం. స్థానిక లేదా సాపేక్ష ఖచ్చితత్వాన్ని మ్యాప్‌లోని రెండు పాయింట్ల మధ్య దూరం వాస్తవ ప్రపంచంలో ఆ పాయింట్ల మధ్య దూరాలకు అనుగుణంగా ఉంటుంది. మదవాలాగామ, ఎస్.ఎల్., మునసింగ్, ఎన్., దంపేగామ, ఎస్.డి.పి.జె. మరియు సమరకూన్, ఎల్. consu వినియోగదారుల గ్రేడ్‌తో తక్కువ-ధర ఏరియల్ మ్యాపింగ్. » రిమోట్ సెన్సింగ్‌పై 37 వ ఆసియా సమావేశం. కొలంబో, శ్రీలంక, 2016. మ్యాప్ ఖచ్చితత్వం మాథర్, స్టీఫెన్. OpenDroneMap. 30 డి మార్జో డి 2020. https://community.opendronemap.org/t/the-accuracy-of-webodm-using-rtk-uavs/3937 (సేకరణ తేదీ 10 12, 2020). పాస్కల్, మాన్యువల్ ఎస్. జిఐఎస్ లాంజ్: జిఐఎస్ డేటా: ఎ లుక్ ఎట్ ఖచ్చితత్వం, ప్రెసిషన్, మరియు రకాలు లోపాలు. 11 6, 2011. https://www.gislounge.com/gis-data-a-look-at-accuracy-precision-and-types-of-errors/ (యాక్సెస్ 07 09, 2020). పిక్స్ 4 డి. A ఏరియల్ మ్యాపింగ్ ప్రాజెక్టులో ఖచ్చితత్వం ఏమిటి? » పిక్స్ 4 డి. 25 డి 05 డి 2019. https://www.pix4d.com/blog/accuracy-aerial-mapping  (యాక్సెస్డ్ 10 13, 2020). ప్రస్తావనలు సాపేక్ష ఖచ్చితత్వం ప్రపంచంలోని మ్యాప్ యొక్క స్థానానికి స్వతంత్రంగా ఉంటుంది, కాబట్టి మ్యాప్ అధిక సాపేక్ష ఖచ్చితత్వాన్ని కలిగి ఉంటుంది (పరిమాణం మరియు ఆకారంలో) కానీ ప్రపంచంలో దాని స్థానాన్ని మార్చవచ్చు (మూర్తి 1). ఫ్లైట్ ఎత్తులో ఎక్కువ, ఇమేజ్ పాదముద్ర మరియు జిఎస్‌డి పెద్దవి. గుర్తించదగిన లక్షణాలలో తక్కువ వివరాలు ఉన్నందున ఫలితమయ్యే పెద్ద GSD ఖచ్చితత్వం తగ్గుతుంది. ఒక చిన్న GSD అవసరమైనప్పుడు ఎత్తైన ప్రదేశం యొక్క ఎత్తు 3 నుండి 4 రెట్లు ఎత్తుగా సిఫార్సు చేయబడింది. ఫోటోగ్రామెట్రీ ఫలితాల్లో వాతావరణ పరిస్థితులు ప్రత్యక్ష ప్రభావాన్ని చూపుతాయి, కాబట్టి క్లౌడ్ కవరేజ్, గాలి వేగం, తేమ, సూర్యుడి ఎత్తు మరియు UAV స్థిరత్వం మరియు భూభాగ ప్రకాశాన్ని ప్రభావితం చేసే ఇతర అంశాలను పరిగణనలోకి తీసుకోవడం చాలా ముఖ్యం. ఏమి ఆశించను GCP ని ఉపయోగిస్తున్నప్పుడు, క్షితిజ సమాంతర ఖచ్చితత్వానికి సంపూర్ణ ఖచ్చితత్వాన్ని 2.5 రెట్లు GSD మరియు నిలువు ఖచ్చితత్వానికి 4 రెట్లు GSD గా మెరుగుపరచవచ్చు (మాడవాలాగామా 2016). `ఈ పత్రాలను సవరించడానికి సహాయం చెయ్యండి! <https://github.com/OpenDroneMap/docs/blob/publish/source/tutorials.rst>`_ 