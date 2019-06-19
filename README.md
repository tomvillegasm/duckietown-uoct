# Duckietown UOCT
**Unidad Operativo de Control de Transito (UOCT) de Duckietown.**

El presente proyecto tiene como objetivo implementar un sistema de semáforos sincronizados en las calles de Duckietown.

Cada semáforo constará de dos luces red lgb, una por cada vía donde se ubica el semáforo.

# Conexión USB

![usb-conection](https://raw.githubusercontent.com/tomvillegasm/duckietown-uoct/master/img/usb-conection.png)

>Se necesita una conexión USB para controlar cada Arduino, ejecución en paralelo puede requerir un Hub de entradas USB.

## Requisitos

* Placa Arduino
* Cable USB a USB-B (ambos macho)
* Hub de puertos USB
* Software ROS
* Software Arduino

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
* PoE Module (uno por cada Arduino)
* Cables Ethernet (uno por cada Arduino)
* Router / Ethernet Switch
* Software ROS
* Software Arduino
