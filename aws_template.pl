#!/usr/bin/perl

use strict;
use warnings;

use Template;
use YAML 'LoadFile';

use Data::Dumper;

my $yaml = LoadFile('iam.yml');


my $template_file = 'aws_template.tt';

my $template = Template->new();

my $services = {};

foreach my $action (@{$yaml})
{
    $services->{$action->{'service'}} = 1;
}

my @sorted_services = sort(keys(%{$services}));

my $vars = {
    services => \@sorted_services,
    actions => $yaml,
    aws => 1
};

$template->process($template_file, $vars, 'index.html') || die "Template process failed: ", $template->error(), "\n";
