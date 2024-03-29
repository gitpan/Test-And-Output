
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Capture output during other tests\r",
  "AUTHOR" => "Jed Lund <jandrew\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Modern::Perl" => 0,
    "Test::Exception" => 0,
    "Test::Moose" => 0,
    "Test::More" => 0,
    "Test::Most" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Test-And-Output",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Test::And::Output",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Moose" => 0,
    "MooseX::NonMoose" => 0,
    "MooseX::StrictConstructor" => 0,
    "MooseX::Types::Moose" => 0,
    "Smart::Comments" => 0,
    "Test::Builder::Module" => 0,
    "YAML::Any" => 0,
    "strict" => 0,
    "version" => "0.94"
  },
  "VERSION" => "v0.003_005",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



