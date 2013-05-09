class Song(object):

# what is this __init___ thing?
# it runs no matter what every time you instantiat a class.

    def __init__(self, lyrics):
        self.lyrics = lyrics
        
# So this is a Method

    def sing_me_a_song(self):
        for line in self.lyrics:
            print line

# so the [ ] make what's inside an object and that is DATA
# which it is important to see the blend of form and data
# by happy_bday and bulls_on_parade

# On the next line we are just passing data before anything is done with it
# the function __init__ is just storing the data on a stack called self.lyrics
happy_bday = Song(["Happy birthday to you",
                   "I don't want to get sued",
                   "So I'll stop right there"])

bulls_on_parade = Song(["They rally around the family",
                        "With pockets full of shells"])

happy_bday.sing_me_a_song()

bulls_on_parade.sing_me_a_song()










