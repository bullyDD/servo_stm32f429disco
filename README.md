# servo_stm32f429disco
Interface package to drive servo 9G with Ada using stm32f429 discovery board.\
As mentioned in the datasheet, Servo can rotate approximately 180 degrees (90 in each direction), and works just like the standard kinds but smaller.


## Servo specifications

_ Weight: 9g
_ Dimension: 22.2 x 11.8 x 31 mm approx
_ Stall torque: 1.8 Kgf.cm
_ Operating speed: 0.1 s/60 degree
_ Operating voltage: 4.8V (-5V)
_ Dead band width: 10 micro second
_ Temperature range: 0°c - 55°C.


**How to drive it ?**\

>Position 0° (1.5ms pulse) is middle.\
>Position 90° (2.0 ms pulse) is all the way to the right.\
>Position -90° (1.0 ms pulse) is all the way to the left.\



**Servo 9G**\
\
![](https://jamara-shop.com/media/image/product/6996/md/033212_servo-high-end-micro-9g-boite-de-vitesse-en-plastiques~5.jpg)


## Prerequesite (tested on linux ubuntu 22.04 )

**Alire**: <https://github.com/alire-project/alire/releases>

1. Download and unzip the latest linux zip
2. Add *where_you_unzipped/alr* to PATH.
3. Verify Alire is found on your path by running this command on your terminal:

    which alr

## OpenOCD

Here is a [very good tutorial](<https://youtu.be/-p26X8lTAvo>) on how to install openocd on ubuntu.


**STM32f429 Discovery board**\
\
![](http://stm32f4-discovery.net/wp-content/uploads/2014/06/stm32f429i-disco1.jpg)
* Plug it to your computer using the [USB MINI B cable](<https://fr.aliexpress.com/item/1005001942868270.html?algo_pvid=ca3f3071-36ed-4210-9a35-d2635ae72b56&algo_exp_id=ca3f3071-36ed-4210-9a35-d2635ae72b56-0&pdp_ext_f=%7B%22sku_id%22%3A%2212000018176126358%22%7D&pdp_npi=3%40dis%21XOF%211301.0%211042.0%21%21%21%21%21%402102172f16777957964894627d06fd%2112000018176126358%21sea%21SN%210&curPageLogUid=OkJbd81354FL>)


## Download 
if you don't have git yet, you can downloaded it [here](https://git-scm.com/downloads).

Then create a new folder or move in the directory of your choice and clone this repository by running:

    git clone https://github.com/bullyDD/servo_stm32f429disco.git


## Build
Inside servo_stm32f429disco repo, run:

    alr build
    eval "$(alr printenv)"
    gprbuild servo_stm32f429disco.gpr


## Build with gnatstudio
    gnatstudio servo_stm32f429disco.gpr

## Run 
Now you can run the code on stm32f429 discovery board by running:

    openocd -f /usr/local/share/openocd/scripts/board/stm32f429disc1.cfg -c 'program bin/servo_stm32f429disco verify reset exit'

As result you should see servo perform **sweep from 90° to -90°** (each 45°). :-)

