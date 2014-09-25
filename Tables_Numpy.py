import numpy as np

num = 10
table = np.zeros((25, num)) 

row, col = table.shape
print row, col  # >> 2, 10
print table

for i in range(row): 
    for ii in range(col):
        table[i][ii] = 1

print table
