package KossyTraining::Model::DB;
use parent 'Teng';

package KossyTraining::Model::DB::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;

table {
    name 'todos';
    pk 'id';
    columns qw/id name/;
};

1;
