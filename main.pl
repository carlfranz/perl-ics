#!/usr/bin/perl

use 5.010;

use strict;
use warnings;
use Data::Dumper;
use DateTime;

use DateParser qw(
  parse_date
);

use Interval qw(
  from_dates
);


use Template qw(
  generate
  header
  footer
);

our $VERSION = 1.0.0;

################################# VARIABLES ###################################
# Data
my $customer = 'customer';
my $from     = '28/10/2019';
my $to       = '29/11/2019';

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
my $d1 = ${parse_date($from)};
my $d2 = ${parse_date($to)};

my $interval = from_dates($d1,$d2);

my $header = header();
my $footer = footer();

my $output = qq|${header}\n|;
foreach my $day (@{$interval}) {
    my $ics_ref = ${generate($day,$customer)};
    $output = qq|${output}${ics_ref}|;
}
$output = qq|${output}${footer}\n|;
print $output;

1;