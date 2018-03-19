use strict;
use warnings;
# Enable generator { BLOCK } and yield
use Coro::Generator;
# Array reference to iterate over
my $chars = ['A'...'Z'];

# New generator which can be called like a coderef.
my $letters = generator {
    my $i = 0;
    for my $letter (@$chars) {
        # get next letter from $chars
        yield $letter;
    }
};

# Call the generator 15 times.
print $letters->(), "\n" for (0..15);

