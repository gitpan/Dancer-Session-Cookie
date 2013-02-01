
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Encrypted cookie-based session backend for Dancer",
  "AUTHOR" => "Alex Kapranoff <kappa\@cpan.org>, Alex Sukria <sukria\@cpan.org>, David Golden <dagolden\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Dancer::ModuleLoader" => 0,
    "File::Find" => 0,
    "File::Spec" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "HTTP::Cookies" => 0,
    "LWP" => 0,
    "LWP::UserAgent" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "Test::NoWarnings" => 0,
    "Test::TCP" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dancer-Session-Cookie",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dancer::Session::Cookie",
  "PREREQ_PM" => {
    "Crypt::CBC" => 0,
    "Crypt::Rijndael" => 0,
    "Dancer" => 0,
    "Dancer::Session::Abstract" => 0,
    "MIME::Base64" => 0,
    "Session::Storage::Secure" => 0,
    "Storable" => 0,
    "String::CRC32" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.001",
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



