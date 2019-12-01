#line 1 DateParser.pm
package DateParser;

use 5.010;

use strict;
use warnings;
use Data::Dumper;
use Carp;

our $VERSION = 1.0;

use base 'Exporter';
our @EXPORT_OK = qw(
    parse_date  
);

################################ MODULE #######################################
# Parse a date from standard time 31/12/2019 and returns a DateTime object
# or croaks
#
sub parse_date {
    my $str = shift;
    my %parsed_date;

    my $local_tz = DateTime::TimeZone->new( name => 'local' );

    if ( $str =~ qr/(\d{1,2})\/(\d{1,2})\/(\d{4})/mpsx ) {
        %parsed_date = ( day => $1, month => $2, year => $3 );
    }
    else {
        croak("Unable to parse date \"$str\"");
    }
    my $ret_val = DateTime->new(%parsed_date);
    
    return \$ret_val;
}

1;