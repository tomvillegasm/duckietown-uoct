# Duckietown UOCT

**Unidad Operativo de Control de Transito (UOCT) de Duckietown.**

* Este repositorio contiene todos los elementos que conforman la red interconectada UOCT.

> Favor de no editar si no se tiene un manejo de la sección.

Como base existen tres proyectos que Duckietown necesita para mejor la calidad del tránsito:

**Semáforos** [(_stoplight_)](https://github.com/tomvillegasm/duckietown-uoct/tree/master/catkin_ws/src/stoplight)

![2019-1-18](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/uoct-stoplight/2019-1-18.jpg)

* Red de semáforos sincronizados que asegura un cruce seguro a los patones (peatones pato) y un flujo ordenado de los duckiebots (autos autónomos).

**Vigilancia** [(_surveillance_)](https://github.com/tomvillegasm/duckietown-uoct/tree/master/catkin_ws/src/surveillance)
* Red de cámaras sincronizadas que están al tanto de los elementos presentes en las calles.

**Sensores** [(_sensors_)](https://github.com/tomvillegasm/duckietown-uoct/tree/master/catkin_ws/src/sensors)
* Red de sensores que publican datos de relevancia sobre el estado de las calles e.g. proximidad de duckiebots al borde de la acera.

## ROS Workspace

### Básico

Puedes trabajar en UOCT desde cualquier laptop con OS Linux, el directorio base es **~/duckietown-uoct** y de allí dentro se puede trabajar de igual forma que lo aprendido en las capacitaciones.

### Avanzado

Las capacitaciones de Duckietown se trabajan siempre dentro de los duckiebots, cada uno de estos vehículos viene con un OS Linux ejecutado sobre un Rasberry Pi al que se accede mediante _ssh_ (protocolo seguro de intercambio de comandos vía red).

La problemática de esto es la necesidad de tener un duckiebot para poder trabajar en el código. Por este motivo UOCT fue creado originalmente con el propósito de _simular_ este espacio y poder trabajar localmente en el laptop del _trainee_.

> Al momento de escribir esta guía, UOCT no formaba parte del respositorio oficial de la compañía, por lo que cualquier cambio de bajo nivel como los que se menconan sólo resultaban efectivo en la copia local del trainee, arriesgando pérdidas significativas del proyecto.

El directorio base alojado en GitHub es **~/duckietown-uoct** y una vez clonado en el laptop adquirirá la estructura **/home/username/duckietown-uoct**

El siguiente nivel es **~/duckietown-uoct/catkin_ws** donde _catkin_ es el aspecto más importante de ROS. Allí dentro viven todos los _packages_ (proyecto semáforo, vigilancia, sensores) y es la carpeta global donde se pueden crear más packages que ROS reconocerá como tales. De ahí que se llame _Workspace_. Catkin sigue un protocolo para administrar su contendido (ver Wiki de ROS) que debe ser seguido al pie de la letra, del contrario ROS no entenderá los cambios nuevos que se realicen.

> catkin_ws y todos los paquetes fueron creados mediante prueba y error, esta guía desgloza los aspecto de importancia en caso de necesitarse hacer cambios de bajo nivel como crear un nuevo Workspace o Package.

En la carpeta **~/catkin_ws/src** se encuentran directorios con estructura estándar **~/package/src** donde _package_ es el nombre dado al proyecto (es un directorio, pero ROS le llama package) y _src_ el directorio, siempre del mismo nombre, destinado a los archivos de código (.py en su defecto).

Con todo esto confgurado, recién podemos hablar de UOCT como un elemento independiente de los Duckiebots capaz de auto-administrarse con su propio ROS-master.

## UOCT y Duckiebots

El siguiente proyecto **no tiene avance** y tiene como objetivo formar una base sobre la cual los trainee puedan trabajar en proyectos de mayor envergadura sin la necesidad de configurar opciones de bajo nivel.

### ROS-Master1 con ROS-Master2

Este aspecto es el más complejo que UOCT puede llegar a desarrollar: la interacción con un duckiebot.

Un ROS-Master es la estructura más alta en la jerarquía que permite a elementos debajo de él verse y comunicarse entre sí. Hacer que dos ROS-Master puedan verse tiene dos aspecto:

#### Librerías
* La parte sencilla de la configuración, ROS-Master1 (UOCT) se conecta al mismo LAN que ROS-Master2 (duckiebot) y con **multimaster_fkie** se publican y suscriben mensajes fuera del master.

#### LAN
* La parte compleja de la configuración, hay que crear una red LAN muy específica dentro del OS Linux que haga posible el intercambio de mensajes de los master.
* La [siguiente guía](https://www.iri.upc.edu/files/scidoc/1607-Multi-master-ROS-systems.pdf) es un acercamiento a los aspecto de bajo nivel a editar dentro de los OS Linux (no aclarados en la Wiki de ROS) para permitir que **multimaster_fkie** cumple su propósito.

#### Problemáticas
* UOCT deberá configiurar una conexión LAN con todas las terminales de duckiebots en los laptops (via ssh), para no obstaculizar el debugging de los trainee.
* Una conexión inalámbrica es imposible, puesto que las tarjeta de Wifi están ocupadas en la relación Laptop-Duckiebot
* Esto obliga a que cualquier existencia de un WLAN recaiga en UOCT mediante un Router exclusivo con conexiones Ethernet a los latops.
* Un factor negativo de esto es la alta densidad de redes 2.4GHz en el área que fuerza a utilizar 5GHz (tecnología fuera del presupuesto).
* La red LAN debe ser flexible y permitir la conexión/desconexión inesperada de duckiebots sin perder su integración al sistema.
* Esto requiere la creación de un _namespace_ que contenga _nodos_ que reconozcan _IP Estáticas_ otorgadas por un _Ethernet Switch_.

> ¡Añadir esquema _mermaid_ para explicar la situación!

#### Conclusiones (No-Resulto)
Llevar a cabo este proyecto requiere considerar numerosos factores y evaluar la factibilidad de las soluciones propuestas.

Es obligatorio tener conocimientos sobre protocolos bajo conexiones _Ethernet_
