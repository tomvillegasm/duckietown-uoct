# Duckietown UOCT
**Unidad Operativo de Control de Transito (UOCT) de Duckietown.**

El presente proyecto tiene como objetivo implementar un sistema de semáforos sincronizados en las calles de Duckietown.

Cada semáforo constará de dos luces red lgb, una por cada vía donde se ubica el semáforo.

**[Insertar diseño 3D de los semáforos e indicar posición de las luces led]**

# Conexión USB

![usb-conection](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/usb-conection.png)

>Se necesita una conexión USB para controlar cada Arduino, ejecución en paralelo puede requerir un Hub de entradas USB.

## Requisitos

* Placa Arduino
* Cable USB a USB-B (ambos macho)
* Hub de puertos USB
* Software ROS
* Software Arduino

## Instrucciones Arduino

Testeado con placa Arduino Uno, el siguiente esquema usa como ejemplo el archivo Blink.ino

* Se arma un circuito con led RGB que alternará entre rojo y verde (sujeto a cambio).

* Se conecta el Arduino al computador mediante el cable USB compatible.

* Se configura el _Sketch_ importando la librería ros_lib al comienzo mediante:

```
#include <ros.h>
// Importa la librería ros_lib para comunicarse con ROS

#include <std_msgs/Empty.h>
//Establece la comunicación con ROS (sub y pub)

ros::NodeHandle  nh;
//Vuelve a Arduino un nodo de ROS
```

* Para que Arduino reciba instrucciones de ROS, primero creamos un **void mesageCB()** con la función del subscriptor.

```
void messageCb( const std_msgs::Empty & toggle_msg)
{
  //La instrucción a ejecutar en Arduino.
  digitalWrite(LED_BUILTIN, HIGH-digitalRead(LED_BUILTIN));
}
```

* Luego crea un subscriptor al tópico **/toggle_led** de ROS y ejecuta la función **void messageCb()** cada vez que recibe un mensaje. Como el mensaje es del tipo _empty_, no intercambia información.

```
ros::Subscriber<std_msgs::Empty> sub("toggle_led", & messageCb );
```

* La sección **void setup()** funciona con normalidad, añadiendo dos lineas al final del código:

```
void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
  nh.initNode();
  //Inicializa el nodo de ROS
  nh.subscribe(sub);
  //Se subscribe al tópico especificado en el bloque anterior
}
```

* La sección **void loop()** ya no contiene el código a ejecutar, sino que está esperando los mensajes de ROS, quien ejecutará instrucciones mediante la función especificada en **void messageCb()**

```
void loop()
{  
  nh.spinOnce();
  delay(1);
}
```

Finalmente se sube el código a la placa de Arduino.

## Instrucciones ROS

En primera instancia, se inicializa **roscore**. Posterior a ello, se redirigen los mensajes de Arduino hacia ROS.

```
rosrun rosserial_python serial_node.py /dev/ttyFOOX
%Donde FOO hace referencia al puerto (USB o ACM)
%y X hace referencia al número del puerto.
```

Luego cada vez que queramos ejecutar la instrucción dentro de **void messageCb()** podemos utilizar el tópico **/toggle_led** directamente en la terminal:

```
rostopic pub toggle_led std_msgs/Empty --once
```

### Archivo .py

(En Proceso)

# Conexión Ethernet

![ethernet-conection](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/ethernet-conection.png)

>Cada arduino estará conectado a un Router mediante cables Ethernet, formando una red LAN. El computador que envíe las instrucciones realiza una conexión vía Ethernet al Router e identifica cada Arduino mediante su dirección IP estática.

![ethernet-view](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/ethernet-view.png)

**Beneficios**:
1. Se reemplazan las múltiples conexiones USB por Arduino al computador por una única conexión Ethernet y múltiples IP estáticas.
2. Permite la interconectividad de distintos elementos de la UOCT tales como cámaras de vigilancia, semáforos y sensores con elementos propios de los vehículos automatizados e.g. detener el vehículo cuando no se respeta un semáforo en rojo.

## Requisitos

* Arduino Uno
* Arduino Shield Ethernet
* Cables Ethernet (uno por cada Arduino)
* Router
* Software ROS
* Software Arduino
