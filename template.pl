#!/usr/bin/perl

use strict;
use warnings;

use Template;
use YAML 'LoadFile';

use Data::Dumper;

my $yaml = LoadFile('iam.yml');

my $template_file = 'attempt3.tt';

my $template = Template->new();

my $vars = {
    actions => $yaml
};

$template->process($template_file, $vars, 'attempt3.html') || die "Template process failed: ", $template->error(), "\n";
