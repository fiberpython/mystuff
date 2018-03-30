

cities = ['Rocking Well', 'New York', 'Newark','Clark']
# The bad way
i = 0
for city in cities:
    print(i, city)
    i +=1

for i, city in enumerate(cities):
    print(i,city)


