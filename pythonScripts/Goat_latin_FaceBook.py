
def string_to_goat_latin(locstg):
    vowel = ("aeiouyAEIOUY")
    const = ("bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ")
    new=[]

    arrlist = locstg.split(" ")
    print "%s" % arrlist

    k=0
    for x in arrlist:
        #print k
        k = k + 1
        #print x
        #print x[:1]
        if x[:1] in vowel:
             new = x[1:] + x[:1] + "ma" + k * "a"
        if x[:1] in const:
                new = x + "ma" + k * "a"
        print "%s\n" % new


string_to_goat_latin('I speak Goat Latin you islen docker')
