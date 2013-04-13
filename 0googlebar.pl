#!/usr/bin/perl

use Device::SerialPort::Arduino;

my $Arduino = Device::SerialPort::Arduino->new(
  port     => '/dev/ttyUSB0',
  baudrate => 115200,

  databits => 8,
  parity   => 'none',
    );

# Reading from Arduino via Serial

$Arduino->communicate($ARGV[0]);

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
