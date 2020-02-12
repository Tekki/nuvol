use strict;

use Test::More;

my $package;

my @functions =  qw|build_test_item test_basics|;

BEGIN {
  $package = 'Nuvol::Test::ItemLive';
  use_ok $package or BAIL_OUT "Unable to load $package";
}

note 'Functions';
can_ok $package, $_ for @functions;

done_testing();