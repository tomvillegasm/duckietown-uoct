# Packages de UOCT

* Cada una de estas carpetas representa un _package_ de ROS donde se guarda un proyecto distinto.
* **Se solicita usar packages distintos para proyectos distintos**.

> Para mayor información visitar la sección _packages_ en la Wiki de ROS.

## Packages fundamentales

* Los siguiente _packages_ **no puden editarse**, pues están sincronizados a repositorios externos de los que sólo se tiene acceso de lectura; todo cambio ejecutado localmente no será sincronizado.

#### **rosserial**

* El _package_ **rosserial** es el encargado de conectar Arduino con ROS.
* Entre sus funciones principales está decirle a ROS los puertos USB donde se encuentra conectado arduino.

> Para mayor información visitar la sección _rosserial arduino_ en la Wiki de ROS.

#### **usb_cam**

* Permite trabajar con las cámaras internas de los laptop, la configuración directa (y recomendada) se realiza mediante el comando `roslaunch usb_cam usb_cam-test.launch`

> Para mayor información visitar la sección _roslaunch_ y _roslaunch XML_ en la Wiki de ROS.
