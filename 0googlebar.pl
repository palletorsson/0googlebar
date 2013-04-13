#!/usr/bin/perl

use Device::SerialPort::Arduino;

my $Arduino = Device::SerialPort::Arduino->new(
  port     => '/dev/ttyUSB0',
  baudrate => 115200,

  databits => 8,
  parity   => 'none',
    );


# Read characters from the end of the "send_to_arduino" file

open $f, "<", "send_to_arduino" or die "touch send_to_arduino, plz";
seek $f, 0, 2;  # Seeks to EOF.

while (1)
{
  while (read($f, $c, 1))
  {
    $Arduino->communicate($c);
    sleep(1);
  };
  
  sleep(1);
  seek $f, 0, 1; # Seeks without moving pointer, to reset EOF.
}



# while (1) {
#   print $Arduino->receive(), "\n";
# }

# or with a delay
# while (1) {
#   print $Arduino->receive(1), "\n";
# }

# Send something via Serial

# $Arduino->communicate('oh hi!!11')
#     or die 'Warning, empty string: ', "$!\n";
