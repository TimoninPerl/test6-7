package tools;

use strict;
use warnings;


sub read_config {
	print "Чтение из модуля tools.\n";
    my ( $filename ) = @_;
    open my $fh, '<', $filename or do {
        print "Не удалось считать конфигурацию с файла: '$filename'";
        return;
    };
    my @lines = <$fh>;
    close $fh;

    my %config;
    foreach my $line ( @lines ) {
        chomp $line; 
        $line =~ s/\s//g;  #удаляем пробелы
        next if $line eq "" || $line =~ /^#/;  # проускаем пустые строки и комментарии
        if ( my ( $key, $value ) = split( /=/, $line, 2 )) {
            $config{$key} = $value if $key && $value;
        }
    }
    return %config;
}
1;
