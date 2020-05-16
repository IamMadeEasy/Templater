#!/usr/bin/perl

use strict;
use warnings;

use Template;
use YAML 'LoadFile';

my $template_file = 'azure_template.tt';

my $template = Template->new();

my $vars = {
    azure => 1
};

$template->process($template_file, $vars, 'azure.html') || die "Template process failed: ", $template->error(), "\n";
