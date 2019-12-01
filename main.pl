#!/usr/bin/perl

use 5.010;

use strict;
use warnings;
use Data::Dumper;
use DateTime;

use DateParser qw(
  parse_date
);

use Template qw(
  generate
);

our $VERSION = 1.0.0;

################################# VARIABLES ###################################
# Data
my $customer = 'mycustomer';
my $from     = '24/05/2019';
my $to       = '25/05/2019';

################################ PROGRAM ######################################
# Generate an ICAL
#
# - name of the event = $customer
# - event start date = $from
# - event end date = $to
#
# Two events will be generated for every date one from 9 AM to 1 PM and the
# othe from 2 PM to 6 PM
#
my $d1 = parse_date($from);
my $d2 = parse_date($to);




foreach my $day (@interval) {
    my $output = generate($customer,$day);
    print $output;
}

1;