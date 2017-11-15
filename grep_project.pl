#!/usr/bin/perl

use Cwd qw(getcwd);
use File::Spec;
use 5.18.2;
use warnings;

sub usage {
	"USAGE: grep_project PATTERN\n";
}

sub DOT_FILE { '.grep_project' }

sub ch_prjdir {
	my $last = '';
	for(my $cwd; (($cwd = getcwd)) ne $last; $last = $cwd, chdir '..') {
		return $cwd if -e DOT_FILE;
		return $cwd if -d "$cwd/.git";
		return $cwd if -d "$cwd/.svn";
		return $cwd if -d "$cwd/.hg";
	}
	return 0;
}

sub make_cmdln {
	my $directory = shift(@_);
	my $args = join(' ', map { /^[^-]/ ? "'$_'" : $_ } @_);
	my $dotfile = ((-e DOT_FILE) ? '' : '~/') . DOT_FILE;
	-e $dotfile or return '';
	open my $file, '<', $dotfile;
	return join(' ', map {
		chomp;
		s/\$\*/$args/g;
		s/\$\//$directory/g;
		$_;
	} <$file>);
}

@ARGV or die usage;

my @args = @ARGV;
my $cwd = getcwd;
ch_prjdir or die DOT_FILE . " not found\n";
my $proj_dir = getcwd;
my $cmdln = make_cmdln($proj_dir, @ARGV);
chdir $cwd;
exec $cmdln;
