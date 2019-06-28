# Duckietown UOCT

**Unidad Operativo de Control de Transito (UOCT) de Duckietown.**

Este repositorio contiene todos los elementos que conforman la red interconectada UOCT.

Como base existen tres proyectos que Duckietown necesita para mejor la calidad del tránsito:

**Semáforos** [(_stoplight_)](https://github.com/tomvillegasm/duckietown-uoct/tree/master/catkin_ws/src/stoplight)
* Red de semáforos sincronizados que asegura un cruce seguro a los patones (peatones pato) y un flujo ordenado de los duckiebots (autos autónomos).

**Vigilancia** [(_surveillance_)](https://github.com/tomvillegasm/duckietown-uoct/tree/master/catkin_ws/src/surveillance)
* Red de cámaras sincronizadas que están al tanto de los elementos presentes en las calles.

**Sensores** [(_sensors_)](https://github.com/tomvillegasm/duckietown-uoct/tree/master/catkin_ws/src/sensors)
* Red de sensores que publican datos de relevancia sobre el estado de las calles e.g. proximidad de duckiebots al borde de la acera.
