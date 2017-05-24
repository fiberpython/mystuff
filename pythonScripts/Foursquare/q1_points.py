import sys 

def main():
    intervals=[]
    yx=[]
    print "please enter your ranges"
    for line in sys.stdin.readlines():
        #print "line = %s" % (line)
        if not line.strip():
             continue
        start, _, end = line.partition(' ')
        intervals.extend([int(start), int(end)])

    intervals.sort()
    print "this is the list sorted %s" % (intervals)

        # print "The lowest number is %s" % (intervals[0])
        # print " Again the Smallest number is %s " % (min(intervals))
        # print " largest number in the list is %s" % (max(intervals))
    k = max(intervals) + 1
    for xy in range(min(intervals), k):    
        yx.append(xy)
    yx = sorted(set(yx))
    print "yx is %s" % (yx)

    print " the Diff of the lists %s" % (list(set(yx) - set(intervals)))


    #for interval in uncovered_intervals(intervals):
    #    print interval.start, interval.end

    #     print "%s is lines" % (lines)
    # intervals1 = intervals(map(int, intervals1))

if __name__ == '__main__':
  main()
