#!/usr/local/bin/python2.7

def sq_num(nums):
    for i in nums:
        yield (i*i)

my_nums = sq_num([1,2,3,4,5])

print next(my_nums)
print next(my_nums)
print next(my_nums)
print next(my_nums)
print next(my_nums)

#List comprehencion
# my_nums = [x*x for x in [1,2,3,4,5]]
