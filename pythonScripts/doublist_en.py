#!/usr/bin/python

def double_list(alist):
    for i in range(len(alist)):
        alist[i] = 3 * alist[i]

x = [1, 2, 3, 4, 5]
double_list(x)
print x  
