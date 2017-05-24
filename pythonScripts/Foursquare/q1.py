#!/usr/bin/python
import sys

class Interval(object):
    def __init__(self, start, end):
        self.start = start
        self.end = end




def uncovered_intervals(intervals):
    uncovered = []
     #I need to sum up the all the intervals
     # I will assume that I know the start as 1
     # but I will need to see the largest number
     # Now I will pick thur the numbers to find 
     # numbers that are not there

    return uncovered

def main():
    # note: ['2 6\n', '8 9\n', '23 137\n', '17 19\n'] is lines
    intervals = []
    print "please enter your ranges:"
    for line in sys.stdin.readlines():
        if not line.strip():
            continue
        start, _, end = line.partition(' ')
        intervals.append(Interval(int(start), int(end)))
        print "Start %d  and now the End %s" % (start, end)
    #for interval in uncovered_intervals(intervals):
    #    print interval.start, interval.end

if __name__ == '__main__':
  main()
