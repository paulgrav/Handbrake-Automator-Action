#!/usr/bin/env perl

#  main.command
#  video-encode

#  Created by Paul Grave on 16/07/2011.
#  Copyright 2011 Paul Grave. All rights reserved.

use strict;
use File::Temp qw/ tempfile /;
use File::Copy;

my @handbrakePresets = ('Universal',
'iPod',
'iPhone & iPod Touch',
'iPhone 4',
'iPad',
'AppleTV',
'AppleTV 2',
'Normal',
'High Profile',
'Classic',
'AppleTV Legacy',
'iPhone Legacy',
'iPod Legacy');

my $deinterlaceOptions = ( 'fast', 'slow', 'slower' );

my $cmd="/Applications/HandBrakeCLI";
my $handbrakePresetIndex = $ENV{'handbrakePreset'} + 0;
my $removeOriginal = $ENV{'removeOriginal'} + 0;
my $container = $ENV{'container'} + 0;
my $quality = $ENV{'quality'} + 0;
my $deinterlace = $ENV{'quality'} + 0;


my $suffix = 'm4v';
my $qualityOption = "";
my $deinterlaceOption = "";

if( $container ) {
$suffix = 'mkv';
}

if( $quality != 20 ) {
$qualityOption = "-q $quality";
}

if( $deinterlace ) {
$deinterlaceOption = $deinterlaceOptions[$deinterlace-1];
$deinterlaceOption = "--deinterlace='$deinterlaceOption'";
}

my $handbrakePreset = $handbrakePresets[$handbrakePresetIndex];

my @files = (<>);

foreach my $filePath (@files) {
chomp($filePath);

my $outfile = $filePath;
$outfile =~ s/\.\w+$//;
$outfile .= ".$suffix";
my ($fh, $tempfile) = tempfile( SUFFIX => '.$suffix' );

# "$cmd" -i "$filePath" --preset="$handbrakePreset" -o "$tempfile > /dev/console";
my $removeCMD = "osascript -e 'tell app \"Finder\" to delete POSIX file \"$filePath\"' >> /Users/paul/rem.log 2>&1";
my $encodeCMD = "$cmd -i '$filePath' $deinterlaceOption $qualityOption --preset='$handbrakePreset' -o '$tempfile' >> /Users/paul/enc.log 2>&1";

if( $removeOriginal ) {
system($encodeCMD) == 0 && move($tempfile,$outfile) && system($removeCMD);
} else {
system($encodeCMD) == 0 && move($tempfile,$outfile);
}

}
