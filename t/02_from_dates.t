## no critic (RequireVersionVar, RequireExplicitPackage)
use strict;

use warnings;
use Test;
use DateTime;
use Data::Dumper;

# load your module...
use Interval qw(from_dates);

# use a BEGIN block so we print our plan before MyModule is loaded
BEGIN { plan tests => 3 }

my $from = DateTime->new(
    year       => 1966,
    month      => 10,
    day        => 25,
);

my $to = DateTime->new(
    year       => 1966,
    month      => 10,
    day        => 30,
);

my $comparison  = 0;


my $output_ref = from_dates($from, $to);

my @result = @{$output_ref};
# foreach my $day (@result) {
#     print Dumper $day->ymd();
# }

ok(scalar @result eq 6);
ok( DateTime->compare($result[0],$from) eq 0);
ok( DateTime->compare($result[5],$to) eq 0);

1;