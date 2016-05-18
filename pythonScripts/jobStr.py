
string = 'vanillabeans'
char = 'a'

def findcount(datav,search):

	count=0
	for x in datav:
		if x == search:
			count = count + 1

		"""print x"""
	return count


print findcount(string,char)