#!/Users/bssg/anaconda3/bin/python3

def print_formatted(n):
    for k in range(n):
        print("{}\t{}\t{}\t{}".format(int(k),oct(k),hex(k),bin(k)))

if __name__ == '__main__':
    n = int(input())
    print_formatted(n)
