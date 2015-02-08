
friends = ['john', 'pat', 'gary', 'michael']
counter = 0
for i, name in enumerate(friends):
    # print "iteration {iteration} is {name}".format(iteration=i+1, name=name)
    counter += 1

    print "iteration Loop = {iteration} and this is the {tcounter} time thur for name {name}".format(iteration=i, name=name, tcounter=counter)
#    print "your counter is = {tcounter}".format(tcounter=counter)

# So this program does a few things, shows you how to make a counter loop and print it
# shows you that you list above the first element is really just equal to 0 
# note you are using Enumerate
# what the heck is  {0}.format  ? 
