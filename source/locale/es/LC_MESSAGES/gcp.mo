��    '      T              �  �   �  N     	  ]  9   g  	   �  u   �     !     0     @     R  |   h  �   �  �  �    A  �   E	  	   �	  �   
  %   �  
   �  j   �  �   *  m   �  B   *  �   m  M   D  .  �  n   �  %   0  �   V  m   �  �   Z  f        i  >   y  ;   �  a   �  0   V  �  �  �    �   �  R   �    �  b     	   d  �   n     �                :  �   V  �   �  �  �    �  �   �  	   u  �    2   8!     k!  �   w!  �   "  �   �"  C   9#  �   }#  N   a$  B  �$  �   �%  %   z&  �   �&  w   M'  �   �'  f   �(     �(  L   �(  :   J)  l   �)  0   �)  �  #*   A Ground Control Point (GCP) is a position measurement made on the ground, typically using a high precision GPS. (Toffanin 2019) Create a CSV file that includes the gcp name, northing, easting and elevation. Create a GCP list that only includes gcp name (this is the label that will be seen in the GCP interface), x, y, and z, with a header with a proj4 string of your GCPs (make sure they are in a planar coordinate system, such as UTM. It should look something like this: Elevation values can be set to "NaN" to indicate no value Example:: For good results your file should have a minimum of 15 lines after the header (5 points with 3 images to each point). GCP Editor Pro GCP file format GCP file format:: Ground Control Points Ground control points are useful for correcting distortions in the data and referencing the data to know coordinate systems. Ground control points can be set existing structures like pavement corners, lines on a parking lot or contrasting color floor tiles, otherwise can be set using targets placed on the ground. If you supply a GCP file called ``gcp_list.txt`` then ODM will automatically detect it. If it has another name you can specify using ``--gcp <path>``. If you have a gcp file and want to do georeferencing with exif instead, then you can specify ``--use-exif``. If you have high precision GPS measurements in your images (RTK) and want to use that information along with a gcp file, you can specify ``--force-gps``. In order to ensure each GCP are found in at least 5 images, separate the points 10 to 30 meters from the perimeter of the project. This distance is dependent of the overlapping, so increasing overlapping should reduce the required distance from the perimeter. Keep ground control points visible for all camera locations. Consider the expected ground sampling distance, illumination, vegetation, buildings and all the existing obstacles. POSM GCPi Procure an evenly horizontal distribution of the GCPs within the project, covering high and low elevations. A minimum of 5 GCP works for most of the jobs, and for larger projects 8 – 10 are sufficient. Locate some points near the corners and others in the center, considering that GCP spacing should be larger than the image footprint so that you can’t see more than one GCP in a single image. Recommended practices for GCP setting References Sharp corners are good picks for GCPs. You should also place/find the GCPs evenly around your survey area. Subsequent lines are the X, Y & Z coordinates, your associated pixels, the image filename and optional extra fields, separated by tabs or spaces: Targets can be purchased or build with an ample variety of materials ranging from bucket lids to floor tiles. The 7th column (optional) typically contains the label of the GCP. The POSM GCPi is loaded by default on WebODM. An example is available at `the WebODM Demo <http://demo.webodm.org/plugins/posm-gcpi/>`_. To use this with known ground control XYZ values, one would do the following: The ``gcp_list.txt`` file must be created in the base of your project folder. The first line should contain the name of the projection used for the geo coordinates. This can be specified either as a PROJ string (e.g. ``+proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +no_defs``), EPSG code (e.g. ``EPSG:4326``) or as a ``WGS84 UTM <zone>[N|S]`` value (eg. ``WGS84 UTM 16N``) The following screen will display a map from where to select the GCPs to tag and import the respective images. The format of the GCP file is simple. Then import the CSV from the main screen and type ``+proj=utm +zone=37 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs`` in the ``EPSG/PROJ`` box. Then one can load this GCP list into the interface, load the images, and place each of the GCPs in the image. This app needs to be installed separately or can be loaded as a WebODM plugin from `https://github.com/uav4geo/GCPEditorPro <https://github.com/uav4geo/GCPEditorPro>`_ Toffanin, Piero. `Open Drone Map: The Missing Guide. <https://odmbook.com/>`_ MasseranoLabs LLC, 2019. User Interfaces You can use one of two user interfaces for creating GCP files: `GCP Editor Pro <https://github.com/uav4geo/GCPEditorPro>`_ `Help edit these docs! <https://github.com/OpenDroneMap/docs/blob/publish/source/tutorials.rst>`_ `POSM GCPi <https://github.com/posm/posm-gcpi>`_ `This post has some information about placing Ground Control Targets before a flight <http://diydrones.com/profiles/blogs/ground-control-points-gcps-for-aerial-photography>`_, but if you already have images, you can find your own points in the images post facto. It's important that you find high-contrast objects that are found in **at least** 3 photos, and that you find a minimum of 5 objects. Project-Id-Version: OpenDroneMap 2.0.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-10-26 14:39-0400
PO-Revision-Date: 2020-07-21 21:10+0000
Last-Translator: Israel Barragán <israelbar@gmail.com>, 2020
Language: es
Language-Team: Spanish (https://www.transifex.com/americanredcross/teams/111882/es/)
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 Un Punto de Control Terrestre (GCP por sus siglas en inglés) es una medición de la posición hecha sobre el terreno, típicamente usando un GPS de alta precisión (Toffanin 2019). Crear un archivo csv que incluya el nombre gcp, el norte, el este y la elevación. Crear una lista GCP, que solo incluya el nombre gcp (esta es la etiqueta que se verá en la interfaz GCP), x, y, y z, con un título con una cadena de caracteres proj4  de sus GCPs (asegurese de que están es un sistema de coordenadas plano, como UTM. Debería verse algo así: Los valores de elevación pueden ser establecidos como "NaN" para indicar que no se tiene el dato. Ejemplo:: Para buenos resultados, tu archivo debe tener un mínimo de 15 líneas después del encabezado (5 puntos con 3 imágenes para cada punto). GCP Editor Pro Formato del archivo GCP Formato del archivo GCP:: Puntos de Control Terrestre Los puntos de control terrestre son útiles para corregir distorsiones en los datos y referenciarlos en sistemas de coordenadas conocidos. Los puntos de control terrestres se pueden colocar en estructuras existentes como esquinas de pavimento, líneas en un estacionamiento o baldosas de colores contrastantes; de otra manera, se pueden configurar utilizando objetivos colocados en el suelo. Si suministras un archivo GCP llamado ``gcp_list.txt`` ODM lo detectara automáticamente. Si el archivo tiene otro nombre, puedes especificar usando ``--gcp 1``. Si tienes un archivo gcp y quieres georreferenciar con exif, puedes especificarlo usando  ``--use-exif``. Si tienes medidas GPS de alta precisión en tus imágenes (RTK) y quieres usar esa información junto a tu archivo gcp, puedes especificarlo usando ``--force-gps``. Para asegurar que cada GCP se encuentre en al menos 5 imágenes, separa los puntos de 10 a 30 metros del perímetro del proyecto. Esta distancia depende del traslape, por lo que aumentar el traslape debería reducir la distancia requerida desde el perímetro. Mantén los puntos de control terrestre visibles para todas las ubicaciones de las cámaras. Considere la distancia de muestreo del terreno esperada, la iluminación, vegetación, edificios y todos los obstáculos existentes. POSM GCPi Procura una distribución horizontal uniforme de los GCP dentro del proyecto, cubriendo elevaciones altas y bajas. Un mínimo de 5 GCP funciona para la mayoría de los trabajos y para proyectos más grandes, de 8 a 10 son suficientes. Ubique algunos puntos cerca de las esquinas y otros en el centro, considerando que el espaciado de los GCP debe ser mayor que la huella de la imagen para que no pueda ver más de un GCP en una sola imagen. Prácticas recomendadas para la colocación de GCP Referencias Las esquinas definidas son buenas elecciones para GCPs. También debes colocar los GCP de manera uniforme alrededor del área de la medición. Las líneas siguientes son las coordinadas X, Y y Z, los pixeles asociados, el nombre del archivo de imagen y campos extras opcionales, separados por tabulaciones o espacios: Estos objetivos pueden comprarse o construirse con una amplia variedad de materiales que van desde tapas de cubetas hasta baldosas. La 7a columna (opcional) típicamente contiene la etiqueta del GCP. POSM GCPi esta cargado automaticamente en WebODM. Un ejemplo esta disponible en `the WebODM Demo <http://demo.webodm.org/plugins/posm-gcpi/>`_. Para usarlo con valores XYZ de control terrestre conocidos, se haría lo siguiente: El archivo ``gcp_list.txt`` debe ser creado en la carpeta base de tu proyecto. La primera línea debe contener el nombre de la proyección usada para las coordenadas geográficas.  Esto puede ser especificado con una cadena PROJ (e.g. ``+proj=utm +zone=10 +ellps=WGS84 +datum=WGS84 +units=m +no_defs``), un código EPSG (e.g. ``EPSG:4326``) o como un valor ``WGS84 UTM 1[N|S]`` (eg. ``WGS84 UTM 16N``) La siguiente pantalla va a mostrar un mapa desde donde se puede seleccionar los GCPs a etiquetar e importar las respectivas imágenes. El formato del archivo GCP es simple. Luego importar el archivo CSV desde la pantalla principal y escribir ``+proj=utm +zone=37 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs`` en el cuadro  ``EPSG/PROJ`` . Después se puede cargar la lista GCP en la interfaz, cargar las imágenes y colocar cada uno de los GCPs en la imagen. Esta aplicación necesita ser instalada separadamente o puede ser cargada como un plugin WebODM desde `https://github.com/uav4geo/GCPEditorPro <https://github.com/uav4geo/GCPEditorPro>`_ Toffanin, Piero. `Open Drone Map: The Missing Guide. <https://odmbook.com/>`_ MasseranoLabs LLC, 2019. Interfaces de Usuario Puedes usar una de las dos interfaces de usuario para crear archivos de GCP: `GCP Editor Pro <https://github.com/uav4geo/GCPEditorPro>` `Ayuda a editar estos documentos! <https://github.com/OpenDroneMap/docs/blob/publish/source/tutorials.rst>`_ `POSM GCPi <https://github.com/posm/posm-gcpi>`_ Este post tiene información sobre posicionar objetivos de control terrestre previo a un vuelo.
`This post has some information about placing Ground Control Targets before a flight <http://diydrones.com/profiles/blogs/ground-control-points-gcps-for-aerial-photography>`_, pero si ya tienes imágenes, puedes encontrar tus propios puntos en las imagenes despues. Es importante que encuentres objetos de alto contraste que se encuentren en **al menos** 3 fotos, y que encuentres un mínimo de 5 objetos. 