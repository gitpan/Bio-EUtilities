use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.027

use Test::More  tests => 18 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'Bio/DB/EUtilities.pm',
    'Bio/Tools/EUtilities.pm',
    'Bio/Tools/EUtilities/EUtilDataI.pm',
    'Bio/Tools/EUtilities/EUtilParameters.pm',
    'Bio/Tools/EUtilities/History.pm',
    'Bio/Tools/EUtilities/HistoryI.pm',
    'Bio/Tools/EUtilities/Info.pm',
    'Bio/Tools/EUtilities/Info/FieldInfo.pm',
    'Bio/Tools/EUtilities/Info/LinkInfo.pm',
    'Bio/Tools/EUtilities/Link.pm',
    'Bio/Tools/EUtilities/Link/LinkSet.pm',
    'Bio/Tools/EUtilities/Link/UrlLink.pm',
    'Bio/Tools/EUtilities/Query.pm',
    'Bio/Tools/EUtilities/Query/GlobalQuery.pm',
    'Bio/Tools/EUtilities/Summary.pm',
    'Bio/Tools/EUtilities/Summary/DocSum.pm',
    'Bio/Tools/EUtilities/Summary/Item.pm',
    'Bio/Tools/EUtilities/Summary/ItemContainerI.pm'
);



# no fake home requested

use IPC::Open3;
use IO::Handle;

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stdin = '';     # converted to a gensym by open3
    my $stderr = IO::Handle->new;
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';

    my $pid = open3($stdin, '>&STDERR', $stderr, qq{$^X -Mblib -e"require q[$lib]"});
    waitpid($pid, 0);
    is($? >> 8, 0, "$lib loaded ok");

    if (my @_warnings = <$stderr>)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


