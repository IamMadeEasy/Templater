#!/usr/bin/perl

use strict;
use warnings;

use Template;
use YAML 'LoadFile';

my $template_file = 'gcp_template.tt';

my $template = Template->new();

my $vars = {
    gcp => 1
};

$template->process($template_file, $vars, 'gcp.html') || die "Template process failed: ", $template->error(), "\n";
