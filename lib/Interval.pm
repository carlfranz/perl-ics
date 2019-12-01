#line 1 Inteval.pm
package Interval;

use 5.010;

use strict;
use warnings;
use Data::Dumper;
use Carp;

our $VERSION = 1.0;

use base 'Exporter';
our @EXPORT_OK = qw(
      from_dates
);

################################ MODULE #######################################
# Generate an array of dates from 'start' to 'end' 
#
sub from_dates {
    my $start  = shift;
    my $end    = shift;
    my @retval = ();

    
    my $duration = $end->delta_days($start);  # DateTime::Duration

    my $d1 = $start->clone();
    while ( $duration->in_units('days') > 0 ) {
        
        $duration = $end->subtract_datetime($d1); # returns a new DateTime
        push @retval, $d1;
        $d1 = $d1->clone()->add( days => 1 );
    }
    return \@retval;
}

1;