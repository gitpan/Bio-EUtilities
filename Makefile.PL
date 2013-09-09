
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Webagent which interacts with and retrieves data from NCBI's eUtils.",
  "AUTHOR" => "cjfields <cjfields\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Bio-EUtilities",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Bio::EUtilities",
  "PREREQ_PM" => {
    "Bio::DB::GenericWebAgent" => 0,
    "Bio::ParameterBaseI" => 0,
    "Bio::Root::IO" => 0,
    "Bio::Root::Root" => 0,
    "Bio::Root::RootI" => 0,
    "HTTP::Request" => 0,
    "LWP::UserAgent" => 0,
    "Text::Wrap" => 0,
    "URI" => 0,
    "XML::Simple" => 0,
    "base" => 0,
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0,
    "inc::TestHelper" => 0
  },
  "VERSION" => "1.73",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



