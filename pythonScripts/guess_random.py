#!/usr/bin/env python
""" I'm using the main function """

import random
randomNumber = random.randint(1, 100)



def main():
    print "Guess a number between 1 and 100."
    found = False
    while not found:
        userGuess = input("Your guess: ")
        if userGuess == randomNumber:
            print "You Got it!"
            found = True
        elif userGuess > randomNumber:
            print "Guess Lower!"
        else:
            print "Guess Higher!"


if __name__ == "__main__":
    main()

