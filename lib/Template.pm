#line 1 Template.pm
package Template;

use 5.010;

use strict;
use warnings;
use Data::Dumper;
use Carp;

our $VERSION = 1.0;

use base 'Exporter';
our @EXPORT_OK = qw(
      generate
      header
      footer
);


sub generate {
    my $date  = shift;
    my $customer = shift;

    my $am_start = $date->clone()->set({hour => 9, minute => 0});
    my $am_end = $date->clone()->set({hour => 13, minute => 0});
    my $pm_start = $date->clone()->set({hour => 14, minute => 0});
    my $pm_end = $date->clone()->set({hour => 18, minute => 0});;
    
    my $event = qq|BEGIN:VEVENT\n|;
    $event = qq|${event}DTSTART:${am_start}\n|;
    $event = qq|${event}DTEND:${am_end}\n|;
    $event = qq|${event}SUMMARY:${customer}\n|;
    $event = qq|${event}END:VEVENT\n|;
    $event = qq|${event}BEGIN:VEVENT\n|;
    $event = qq|${event}DTSTART:${pm_start}\n|;
    $event = qq|${event}DTEND:${pm_end}\n|;
    $event = qq|${event}SUMMARY:${customer}\n|;
    $event = qq|${event}END:VEVENT|;

    return \$event;
}


sub header {
    my $header = qq|BEGIN:VCALENDAR\nVERSION:2.0|;
    $header = qq|$header\nPRODID:-//hacksw/handcal//NONSGML v1.0//EN|;
    return $header;
}

sub footer {
    my $footer = 'END:VCALENDAR';
    return $footer;
}
1;