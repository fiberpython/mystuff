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
    intervals = []
    for line in sys.stdin.readlines():
        if not line.strip():
            continue
        start, _, end = line.partition(' ')
        intervals.append(Interval(int(start), int(end)))
    for interval in uncovered_intervals(intervals):
        print interval.start, interval.end

if __name__ == '__main__':
  main()


# One of our monitoring tools records how long various operations within
# a request take. A  problem that we have is that sometimes parts are 
# untimed. We'd like the parts which are not  covered by the intervals 
# so that we can fill them in.  Write a program that reads a list of 
# possibly-overlapping intervals from STDIN, 
# one per line, and  outputs a list of the intervals not​ 
# covered by the input intervals. For example, given input

https://www.udemy.com/the-complete-jenkins-course-for-developers-and-devops/?pmtag=L2RA202&siteID=81xaD7CEKxg-GAOI3HLR3Kkdkpj9nd256Q&LSNPUBID=81xaD7CEKxg

learn Graylog
What is the Difference between Kinesis and SQS
So you would really like to rank the Reserved EC2, On-Demand to the Spot instances by price.

