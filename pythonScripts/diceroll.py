#!/usr/bin/python
#dice roller

import random

def DiceRoller():
 while True:
    sides = raw_input('How many sided dice? (or quit) ')
    if sides == 'quit':
        break
    d = int(sides)
    roll = int(random.random()*d)+1
    print roll
    

DiceRoller()
