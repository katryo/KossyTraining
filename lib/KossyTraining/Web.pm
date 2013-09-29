package KossyTraining::Web;

use strict;
use warnings;
use utf8;
use Kossy;
use KossyTraining::Model::DB;

my $teng = KossyTraining::Model::DB->new(
    +{connect_info => ['dbi:mysql:database=kossy_training', 'root', '']}
);

#vagrantmysqlがvagrantパスワード

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
    my $iter = $teng->search('todos');
    $c->render('index.tx', { info => "Something goes here!", iter => $iter });
};


post '/' => sub {
    my ( $self, $c )  = @_;
    my $result = $c->req->validator([
        'name' => {
            default => 'Hey, write something.'
        }
    ]);
    my $name = $result->valid->get('name');
    my $row = $teng->insert('todos' => {
        name => $name
    });
    $c->render('index.tx', { info => "we got " . $name });
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

