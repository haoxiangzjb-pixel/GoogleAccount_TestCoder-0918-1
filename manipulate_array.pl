#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(shuffle);

# Crear un array de ejemplo
my @array = ('apple', 'banana', 'cherry', 'date', 'elderberry');

# Mostrar el array original
print "Array original: @array\n";

# Manipular el array: ordenar, revertir y barajar
@array = sort @array;
print "Array ordenado: @array\n";

@array = reverse @array;
print "Array revertido: @array\n";

@array = shuffle @array;
print "Array barajado: @array\n";

# Generar un nombre de archivo aleatorio
my $random_filename = 'array_output_' . int(rand(10000)) . '.txt';

# Guardar el array manipulado en el archivo
open(my $fh, '>', $random_filename) or die "No se pudo abrir el archivo '$random_filename': $!";
print $fh "Array manipulado: @array\n";
close($fh);

print "El array manipulado ha sido guardado en: $random_filename\n";