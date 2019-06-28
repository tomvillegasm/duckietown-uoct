# UOCT Semáforos

Este directorio contiene todos los elementos referentes a los semáforos sincronizados de Duckietown.

![2019-1-14](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/uoct-stoplight/2019-1-14.jpg)

> UOCT nace con este proyecto, toda la estructura de trabajo aquí es análoga para los otros proyectos debido a la misma implementación Hardware-Software requerida.

> Se solicita ser meticuloso y explicativo al momento de editar esta guía y directorio, pues son una planitlla para todos los futuros proyectos que se anexen a UOCT.

> Imágenes obtenidas desde el renderizador de diagramas web _mermaid_ (disponible en internet), el visor gráfico _rqt graph_ (proporcionado por ROS), y el quipo de trabajo UOCT-Semáforos 2019.

## Conexiones con Linux

### USB Hub

![usb-conection](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/usb-conection.png)

>Se necesita una conexión USB para controlar cada Arduino, ejecución en paralelo puede requerir un Hub de entradas USB.

#### Advertencia
* Un puerto USB tiene una cantidad máxima de puerto que puede energizar, sobrepasada esa carga el _USB Hub_ **necesitará una fuente de poder externa**.


#### Requisitos

* Placa Arduino
* Cable USB a USB-B (ambos macho)
* Hub de puertos USB
* Software ROS
* Software Arduino

### Ethernet Switch (No implementado)

![ethernet-conection](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/ethernet-conection.png)

>Cada arduino estará conectado a un Router (o Ethernet Switch) mediante cables Ethernet, formando una red LAN. El computador que envíe las instrucciones realiza una conexión vía Ethernet al Router e identifica cada Arduino mediante su dirección IP estática.

![ethernet-view](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/ethernet-view.png)

#### Beneficios
1. Se reemplazan las múltiples conexiones USB por Arduino al computador por una única conexión Ethernet y múltiples IP estáticas.
2. Permite la interconectividad de distintos elementos de la UOCT tales como cámaras de vigilancia, semáforos y sensores con elementos propios de los vehículos automatizados e.g. detener el vehículo cuando no se respeta un semáforo en rojo, todo ello sin saturar la cantidad de puertos USB a utilizar.

#### Advertencia

* PoE Module debe soldarse sobre Arduino Shield Ethernet para energizarlo con la conexión Ethernet.
* Arduino será energizado por un pin y los sistemas de protección ante un corte de energía **no protegerán** al Arduino de un daño en sus circuitos (se puede freir si no se apaga como corresponde).
* Tanto un _Router_ como un _Switch Ethernet_ debe incluir en sus especificaciones la capacidad y cantidad de PoE que puede realizar, esto no es una característica estándar.

#### Requisitos

* Arduino Uno
* Arduino Shield Ethernet
* PoE Module (uno por cada Arduino)
* Cables Ethernet (uno por cada Arduino)
* Router / Ethernet Switch
* Software ROS
* Software Arduino

## Conexiones con Arduino

### Esquema de cableado
![rgb-led-arduino-nano](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/rgb-led-arduino-nano.png)

* Los LED RGB utilian los pines de tipo PWM (símbolo ~) y permiten controlar la intensidad lumínica del LED.
* Muy importante **usar resistencia de al menos 220 amperes**, de no ser así se corre el riesgo de inutilizar (quemar) ese color.
* No olvidar que una patita debe ir conectada a GND y no a las entradas de volts.
> GND es de voltaje 0 y PWM es de voltaje variable. Si se conecta el cable negro a una entrada de 3.3 volt la luz encenderá con muy baja intensidad debido a la poca diferencia de voltaje.


### Arduino Nano y LED RGB
![Mip](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/red-green-led.gif)

## Esquema ROS

![simple-stoplight](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/simple-stoplight.png)

**/timing**
* En este _namespace_ se contienen todos los nodos relacionados a los tiempos del semáforo.
* El ejemplo contiene al nodo **/master** viviendo en su interior, su versión más simple de tiempo de semáforo es la siguiente:
```
# Mientras ROS esté vivo
while not rospy.is_shutdown():
    # Publicar color verde
    pub.publish(1)
    # Dormir 5 segundo
    sleep(5)
    # Publicar color rojo
    pub.publish(0)
    #Dormir 5 segundos
    sleep(5)
```

**/uoct/stoplight**
* Por convención y orden, aquí se publican todos los datos intercambiados por los semáforos.
* El tópico directo (al igual que el de todos los paquetes) está reservado para configuraciones globales de la UOCT, en este ejemplo se está publicando hacia **/uoct/stoplight/master** y como esto ocurre dentro del _namespace_ aparece viviendo dentro de /timing

**/station**
* En este _namespace_ se contienen todos los nodos relacionados a los semáforos físicos.
* ROS entiende todo lo que está aquí dentro como _puertos USB_ de elemento hardware.
* Nuestros semáforos (Arduinos) se suscriben a el tópico y responden a los cambios establecidos por los nodos dentro de /timing

## Reconocimiento de semáforos

Para que los semáforos tenga un efecto en el funcionamiento de los duckiebots, estos deben ser capaces de interpretar los colores que estos emiten.

<center><p float="left">
  <img src="https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/uoct-stoplight/2019-1-15.jpg" width="350"/>
  <img src="https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/uoct-stoplight/2019-1-16.jpg" width="350"/>
</p></center>

> !Falta avanzar los aspectos técnicos!
