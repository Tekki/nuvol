# NAME

Nuvol - A cloud toolkit

# SYNOPSIS

    use Nuvol;

    # connect to a service
    my $configfile = '/path/to/configfile';
    my $service    = '...';  # one of Dropbox, Office365
    my $connector  = Nuvol::autoconnect($configfile, $service);

    # get main drive
    my $drive = $connector->drive('~');

    # upload a file
    use Mojo::File 'path';
    my $file = $drive->item('/My Text.txt')->copy_from(path 'Text on my PC.txt');

    # copy to another file
    my $file_2 = $file->copy_to('/path/to/Text Copy.txt');

    # download
    my $downloaded = $file_2->copy_to(path 'Downloaded Text.txt');

    # change the text
    $file_2->spurt('This text was changed.');

    # read it
    my $content = $file_2->slurp;

    # and delete the file
    $file_2->remove;

# DESCRIPTION

[Nuvol](https://metacpan.org/pod/Nuvol) is a toolkit to manipulate files and folders on cloud services. For
the beginning it supports [Dropbox](https://metacpan.org/pod/Nuvol%3A%3ADropbox), [Office
365](https://metacpan.org/pod/Nuvol%3A%3AOffice365), and a [Dummy service](https://metacpan.org/pod/Nuvol%3A%3ADummy).

    Nuvol
    └── Connector
        ├── Config
        │   └── config file
        └── Drive
            └── Item
                ├── File
                └── Folder

The services are organized in connectors, drives, items, files, and folders. The data needed to
access a service is stored in a config file.

- Connector

    The [Connector](https://metacpan.org/pod/Nuvol%3A%3AConnector) is responsible for authentication and for the connection to the
    cloud service.

- Config and config file

    The config file stores the tokens and other parameters used to establish a connection. Internally is
    is represented by a [Config](https://metacpan.org/pod/Nuvol%3A%3AConfig) object.

    **Warning:** The information in the config file allows full access to your cloud data for anyone who
    can read it. It should be stored at a secure place. Services that are no longer used should be
    disabled with ["disconnect" in Nuvol::Connector](https://metacpan.org/pod/Nuvol%3A%3AConnector#disconnect).

- Drive

    A [Drive](https://metacpan.org/pod/Nuvol%3A%3ADrive) is an isolated area where your data is stored. You may have a drive for your
    personal and another for your business data. Not all cloud providers support different drives.

- Item

    Every object in a drive is an [Item](https://metacpan.org/pod/Nuvol%3A%3AItem). Item is just an abstract type, a real object is
    either a [File](https://metacpan.org/pod/Nuvol%3A%3ARole%3A%3AFile) or a [Folder](https://metacpan.org/pod/Nuvol%3A%3ARole%3A%3AFolder).

    The syntax for drive items is oriented at [Mojo::File](https://metacpan.org/pod/Mojo%3A%3AFile), so anyone familiar with this module will
    recognize most of the methods.

# FUNCTIONS

None of the functions is exported.

## autoconnect

    use Nuvol;
    $connector = Nuvol::autoconnect($configfile, $service);

Opens a connection using an existing config file, or starts an interactive
authentication process if the file doesn't exist. Returns a
[Nuvol::Connector](https://metacpan.org/pod/Nuvol%3A%3AConnector).

## connect

    use Nuvol;
    $connector = Nuvol::connect($configfile);

Opens a connection using an existing config file. Returns a [Nuvol::Connector](https://metacpan.org/pod/Nuvol%3A%3AConnector).

# AUTHOR & COPYRIGHT

© 2013–2020 by Tekki (Rolf Stöckli).

This program is free software, you can redistribute it and/or modify it under the terms of the
Artistic License version 2.0.

# SEE ALSO

[Nuvol::Connector](https://metacpan.org/pod/Nuvol%3A%3AConnector), [Nuvol::Drive](https://metacpan.org/pod/Nuvol%3A%3ADrive), [Nuvol::Item](https://metacpan.org/pod/Nuvol%3A%3AItem), [Nuvol::Test](https://metacpan.org/pod/Nuvol%3A%3ATest).
