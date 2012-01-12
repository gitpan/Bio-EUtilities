
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Bio::Root::Test" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "webagent which interacts with and retrieves data from\nNCBI's eUtils",
  "dist_author" => [
    "cjfields <cjfields\@bioperl.org>"
  ],
  "dist_name" => "Bio-EUtilities",
  "dist_version" => "1.71",
  "license" => "perl",
  "module_name" => "Bio::EUtilities",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Bio::DB::GenericWebAgent" => 0,
    "Bio::ParameterBaseI" => 0,
    "Bio::Root::IO" => 0,
    "Bio::Root::Root" => 0,
    "Bio::Root::RootI" => 0,
    "Data::Dumper" => 0,
    "HTTP::Request" => 0,
    "Text::Wrap" => 0,
    "URI" => 0,
    "XML::Simple" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
