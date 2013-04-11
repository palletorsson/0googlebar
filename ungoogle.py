#!/usr/bin/python2.7
import sys
import serial
import datetime

run_serial = False # turn off/on serial to console
printing = False # turn off/on print to console
time = datetime.datetime.now()

if (run_serial):
    # Check which usb port the Arduino is connected to.
    # You can see it be looking under Tools and Serial Port in the Arduino program.
    # /dev/ttyUSB0, /dev/ttyUSB1, /dev/ttyACM3, /dev/ttyACM4
    usb_port =  '/dev/ttyUSB0'

    baud_rate = 9600

    serial_port = usb_port
    serial_baud = baud_rate
    serial = serial.Serial(serial_port, serial_baud)


# wait for google request and activate blinky
def check_google():
    while(True):
        google_request = sys.stdin.readline()

        if (printing):
            print google_request

        try:
            if (google_request):
                activate_to_indicator()
        except:
            print 'Could not activate google indicator, you might need to connnect the Arduino'


# ping the Arduino and delay next indicator window with 3 seconds
def activate_to_indicator():
    global time
    time2 = datetime.datetime.now()
    diff = time2 - time
    if diff > datetime.timedelta(seconds=1):
        time = time2
        formated_time = time2.strftime('%H:%M:%S')
        print " [ %s ] don't be evil" % formated_time
        # the Arduino is listing to for "g"
        # serial.write("g")



if __name__ == '__main__':
    check_google()