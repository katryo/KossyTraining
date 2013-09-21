package KossyTraining::Model::DB;
use parent 'Teng';

package KossyTraining::Model::DB::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;

table {
    name 'texts';
    columns qw/body/;
};

1;
