#bash!
apt-get install xserver-xorg-video-fbdev
wget https://github.com/venedikli/orangepipc/blob/main/foo.dts
echo "overlays=spi-spidev spi-add-cs1 param_spidev_spi_bus=0 param_spidev_spi_cs=1" > /boot/armbianEnv.txt
echo "fbtft fbtft_device">  /etc/modules-load.d/98-fbtft.conf
echo "fbtft_device rotate=90 name=piscreen speed=16000000 gpios=reset:2,dc:71 txbuflen=32768 fps=25" > /etc/modprobe.d/fbtft.conf
echo "Section \"Device\""  >/usr/share/X11/xorg.conf.d/99-fbdev.conf
echo "Identifier \"piscreen\" Driver \"fbdev\" Option \"fbdev\" \"/dev/fb0\" EndSection" >>/usr/share/X11/xorg.conf.d/99-fbdev.conf
armbian-add-overlay foo.dts
