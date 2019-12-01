## no critic (RequireVersionVar, RequireExplicitPackage)
use strict;

use warnings;
use Test;
use DateTime;
use Data::Dumper;

# load your module...
use Template qw(generate);

# use a BEGIN block so we print our plan before MyModule is loaded
BEGIN { plan tests => 1 }

my $from = DateTime->new(
    year       => 1966,
    month      => 10,
    day        => 25,
    time_zone  => 'Europe/Rome',
);

my @par = ();
push @par, $from;

my $result = generate(\@par, 'foo');

print Dumper $result;

my $expected = '';
$expected = qq|${expected}BEGIN:VCALENDAR\nVERSION:2.0\n|;
$expected = qq|${expected}PRODID:-//hacksw/handcal//NONSGML v1.0//EN\n|;
$expected = qq|${expected}BEGIN:VEVENT\n|;
$expected = qq|${expected}DTSTART:19661025T090000\n|;
$expected = qq|${expected}DTEND:19661025T130000\n|;
$expected = qq|${expected}SUMMARY:foo\n|;
$expected = qq|${expected}END:VEVENT\nBEGIN:VEVENT\n|;
$expected = qq|${expected}DTSTART:19661025T140000\n|;
$expected = qq|${expected}DTEND:19661025T180000\n|;
$expected = qq|${expected}SUMMARY:foo\n|;
$expected = qq|${expected}END:VEVENT\n|;
$expected = qq|${expected}END:VCALENDAR\n|;

ok($result eq $expected);

1;

# BEGIN:VCALENDAR
# VERSION:2.0
# PRODID:-//hacksw/handcal//NONSGML v1.0//EN
# BEGIN:VEVENT
# DTSTART:20190708T090000+0200
# DTEND:20190708T130000+0200
# SUMMARY:customerkik91
# END:VEVENT
# END:VCALENDAR
