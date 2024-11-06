#!/usr/bin/perl
use strict;
use warnings;
use Dancer2;
use JSON;

set serializer => 'JSON';

get '/api/hello' => sub {
    return {
        message => 'Hello, World!',
        status => 'success'
    };
};

get '/api/hello/:name' => sub {
    my $name = route_parameters->get('name');
    return {
        message => "Hello, $name!",
        status => 'success'
    };
};

any qr{.*} => sub {
    status 404;
    return {
        status => 'error',
        message => 'Route not found'
    };
};

dance;