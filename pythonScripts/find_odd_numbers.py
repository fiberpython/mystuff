#!/bin/python

import sys
import os

# function oddNumbers
# Complete the function below.

def  oddNumbers(l, r):
    ans = []
    
    for j in range(l,r+1):
        
        if j%2 == 0:
            pass
        else:
            ans.append(j)
    return ans

#--------------- Main ---------------

f = open(os.environ['OUTPUT_PATH'], 'w')
    

_l = int(raw_input());


_r = int(raw_input());

res = oddNumbers(_l, _r)
for res_cur in res:
    f.write( str(res_cur) + "\n" )

f.close()