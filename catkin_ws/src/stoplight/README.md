# UOCT Semáforos

Este directorio contiene todos los elementos referentes a los semáforos sincronizados de Duckietown.

Cada semáforo consta de dos luces led rgb, una para cada sentido del tránsito

Cada semáforo constará de dos luces red lgb, una por cada vía donde se ubica el semáforo.

# Conexiones con Linux

## USB Hub

![usb-conection](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/usb-conection.png)

>Se necesita una conexión USB para controlar cada Arduino, ejecución en paralelo puede requerir un Hub de entradas USB.

### Requisitos

* Placa Arduino
* Cable USB a USB-B (ambos macho)
* Hub de puertos USB
* Software ROS
* Software Arduino

## Ethernet Switch

![ethernet-conection](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/ethernet-conection.png)

>Cada arduino estará conectado a un Router mediante cables Ethernet, formando una red LAN. El computador que envíe las instrucciones realiza una conexión vía Ethernet al Router e identifica cada Arduino mediante su dirección IP estática.

![ethernet-view](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/ethernet-view.png)

**Beneficios**:
1. Se reemplazan las múltiples conexiones USB por Arduino al computador por una única conexión Ethernet y múltiples IP estáticas.
2. Permite la interconectividad de distintos elementos de la UOCT tales como cámaras de vigilancia, semáforos y sensores con elementos propios de los vehículos automatizados e.g. detener el vehículo cuando no se respeta un semáforo en rojo.

### Requisitos

* Arduino Uno
* Arduino Shield Ethernet
* PoE Module (uno por cada Arduino)
* Cables Ethernet (uno por cada Arduino)
* Router / Ethernet Switch
* Software ROS
* Software Arduino

# Conexiones con Arduino

## Esquema de cableado
![rgb-led-arduino-nano](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/rgb-led-arduino-nano.png)

* Los LED RGB utilian los pines de tipo PWM (símbolo ~) y permiten controlar la intensidad lumínica del LED.
* Muy importante **usar resistencia de al menos 220 amperes**, de no ser así se corre el riesgo de inutilizar (quemar) ese color.
* No olvidar que una patita debe ir conectada a GND y no a las entradas de volts.
> GND es de voltaje 0 y PWM es de voltaje variable. Si se conecta el cable negro a una entrada de 3.3 volt la luz encenderá con muy baja intensidad debido a la poca diferencia de voltaje.


## Arduino Nano y LED RGB
![Mip](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/red-green-led.gif)
