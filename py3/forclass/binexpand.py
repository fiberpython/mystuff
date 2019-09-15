#!/usr/local/bin/python3

import itertools

binary_numbers = [''.join(digits) for digits in itertools.product(*[['0', '1'] for _ in range(10)])]

binary_numbers[:8]