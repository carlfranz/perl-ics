## no critic (RequireVersionVar, RequireExplicitPackage)
use strict;

use warnings;
use Test;
use DateTime;
use Data::Dumper;

# load your module...
use DateParser qw(parse_date);

# use a BEGIN block so we print our plan before MyModule is loaded
BEGIN { plan tests => 1 }

my $expected = DateTime->new(
    year       => 1966,
    month      => 10,
    day        => 25,
    hour       => 0,
    minute     => 0,
    second     => 0,
    nanosecond => 0,
    time_zone  => 'Europe/Rome',
);
my $ret_val = parse_date('25/10/1966');
my $result = ${$ret_val};

ok( DateTime->compare($result,$expected) eq 0 );

1;