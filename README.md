# NAME

Nuvol - A cloud toolkit

# SYNOPSIS

    use Nuvol;

    # connect to a service
    my $configfile = '/path/to/configfile';
    my $connector  = Nuvol::connect($configfile);

    # get main drive
    my $drive = $connector->drive('~');

    # upload a file
    use Mojo::File 'path';
    my $file = $drive->item('My Text.txt')->copy_from(path 'Text on my PC.txt');

    # copy to another file
    my $file_2 = $file->copy_to('path/to/Text Copy.txt');

    # download
    my $downloaded = $file_2->copy_to(path 'Downloaded Text.txt');

# DESCRIPTION

[Nuvol](https://metacpan.org/pod/Nuvol) is a toolkit to work with cloud resources. For the beginning it supports [Office
365](https://metacpan.org/pod/Nuvol%3A%3AOffice365) and a [Dummy service](https://metacpan.org/pod/Nuvol%3A%3ADummy) as cloud services and concentrates on files
and folders.

# FUNCTIONS

None of the functions is exported by default.

## connect

    use Nuvol;
    $connector = Nuvol::connect($configfile);

Opens a connection with an existing config file. Returns a [Nuvol::Connector](https://metacpan.org/pod/Nuvol%3A%3AConnector).

# AUTHOR & COPYRIGHT

© 2013–2020 by Tekki (Rolf Stöckli).

This program is free software, you can redistribute it and/or modify it under the terms of the
Artistic License version 2.0.

# SEE ALSO

[Nuvol::Connector](https://metacpan.org/pod/Nuvol%3A%3AConnector), [Nuvol::Drive](https://metacpan.org/pod/Nuvol%3A%3ADrive), [Nuvol::Item](https://metacpan.org/pod/Nuvol%3A%3AItem), [Nuvol::Test](https://metacpan.org/pod/Nuvol%3A%3ATest).
