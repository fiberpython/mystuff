import sys

class Node:
    def __init__(self,initdata):
        self.data = initdata
        self.next = None

    def getData(self):
        return self.data

    def getNext(self):
        return self.next

    def setData(self,newdata):
        self.data = newdata

    def add(self,item):
    	temp = Node(item)
    	temp.setNext(self.head)
    	self.head = temp

    def setNext(self,newnext):
        self.next = newnext


temp = Node(93)
print 'The number is %d' % temp.getData()



temp = Node(23)
print 'The number is %d' % temp.getData()





