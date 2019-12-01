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
);


my $output_ref = generate($from, 'foo');

my $result = ${$output_ref};

# BEGIN:VCALENDAR
# VERSION:2.0
# PRODID:-//hacksw/handcal//NONSGML v1.0//EN
# BEGIN:VEVENT
# DTSTART:20190708T090000+0200
# DTEND:20190708T130000+0200
# SUMMARY:customerkik91
# END:VEVENT
# END:VCALENDAR


my $expected = qq|BEGIN:VEVENT\n|;
$expected = qq|${expected}DTSTART:1966-10-25T09:00:00\n|;
$expected = qq|${expected}DTEND:1966-10-25T13:00:00\n|;
$expected = qq|${expected}SUMMARY:foo\n|;
$expected = qq|${expected}END:VEVENT\nBEGIN:VEVENT\n|;
$expected = qq|${expected}DTSTART:1966-10-25T14:00:00\n|;
$expected = qq|${expected}DTEND:1966-10-25T18:00:00\n|;
$expected = qq|${expected}SUMMARY:foo\n|;
$expected = qq|${expected}END:VEVENT|;


ok($result eq $expected);

1;