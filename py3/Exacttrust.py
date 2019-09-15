#!/usr/local/bin/python3

# def print_formatted(number):

n = int(input())
number = n
# print_formatted(n)
for k in range(number):
    print(int(k),oct(k).lstrip("0o").rstrip("L"), hex(k).lstrip("0x").rstrip("L"), bin(k).lstrip("0b").rstrip("L")) 
