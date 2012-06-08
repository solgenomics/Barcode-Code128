# -*- Perl -*-

# Make sure the module loads correctly - if GD is 1.20 or higher, use
# 1..0 to cause "skipped on this platform"

my $max;
BEGIN {
    eval { require GD; };
    $max = !$@ && $GD::VERSION < 1.20 ? 2 : 0;
    $| = 1; print "1..$max\n";
}
END {print "not ok 1\n" unless $loaded;}
use Barcode::Code128 qw(FNC1);
$loaded = 1;
print "ok 1\n";
exit unless $max;

# Create a GIF file 
use strict;
my $code = new Barcode::Code128;
my $file = "t/code128.gif";
my $good;
{
    open IM, $file or die "Can't read $file: $!";
    binmode IM;
    read IM, $good, -s $file;
    close IM;
}
my $test = $code->gif("CODE 128");
print "not " unless $test eq $good;
print "ok 2\n";
