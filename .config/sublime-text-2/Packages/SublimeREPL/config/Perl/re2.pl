$| = 1;

my $file = $ARGV[0];
chomp $file;
eval { require $file };