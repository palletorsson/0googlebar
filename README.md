0googlebar
==========

0googlebar

0 Setup your blinky hardware

1 Upload ungoogle.pde to you Arduino

2 Check which usb port the Arduino is connected. You can see it be looking under Tools and Serial Port in the Arduino program. Set the name i ungoogle.py

3 Sudo tcpdump -i wlan0 host google.com  | python ungoogle.py
