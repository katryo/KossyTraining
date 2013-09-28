package KossyTraining::Web;

use strict;
use warnings;
use utf8;
use Kossy;
use KossyTraining::Model::DB;

my $teng = KossyTraining::Model::DB->new(
    +{connect_info => ['dbi:mysql:database=kossy_training', 'root', 'vagrantmysql']}
);

filter 'set_title' => sub {
    my $app = shift;
    sub {
        my ( $self, $c )  = @_;
        $c->stash->{site_name} = __PACKAGE__;
        $app->($self,$c);
    }
};

get '/' => [qw/set_title/] => sub {
    my ( $self, $c )  = @_;
    $c->render('index.tx', { info => "Something goes here!" });
};

post '/' => sub {
    my ( $self, $c )  = @_;
    my $result = $c->req->validator([
        'body' => {
            default => 'Hey, write something.'
        }
    ]);
    my $body = $result->valid->get('body');
    my $row = $teng->insert('texts' => {
        body => $body
    });
    $c->render('index.tx', { info => "we got " . $body });
};

#以下使ってない
get '/json' => sub {
    my ( $self, $c )  = @_;
    my $result = $c->req->validator([
        'q' => {
            default => 'Hello',
            rule => [
                [['CHOICE',qw/Hello Bye/],'Hello or Bye']
            ],
        }
    ]);
    $c->render_json({ greeting => $result->valid->get('q') });
};

1;

