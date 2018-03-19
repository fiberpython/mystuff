
x_list = [1,3,5]
y_list = [2,4,6]
z_list = [0,-1,-2]

for i in range(len(x_list)):
    x = x_list[i]
    y = y_list[i]
    print(x,y)
print(" ")

for x,y,z in zip(x_list, y_list,z_list):
    print(x,y,z)


