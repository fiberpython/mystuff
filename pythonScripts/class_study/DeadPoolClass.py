
# Crazy Class stuff



class Person(object):
    def __init__(self, name):   # this is the parameter list
        self.name = name        # this takes what was passed in and makes it local
    def reveal_identity(self):  # this is just so that you can print it out with dot noteation
        print "My name is {}".format(self.name)

class SuperHero(Person):
    def __init__(self, name, hero_name):   # see here are two things that are pushed in or listing of the parameters
        super(SuperHero, self).__init__(name)  # just don't understand this, what kind of class is this?
        self.hero_name = hero_name         # this is taking one of the parm and making it local
    def reveal_identity(self):
        super(SuperHero, self).reveal_identity()  # so a person class is passed in that allow it to inherert the function reveal_identity
        print "... And I am {}".format(self.hero_name)


wade = SuperHero('Wade Wilson', 'Deadpool')

wade.reveal_identity()

