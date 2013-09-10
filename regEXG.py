import re
for test_string in ['212-536-8416', '212-1LL-EGAL']:

    if re.match(r'^\d{3}-\d{3}-\d{4}$', test_string):
    	
        print test_string, 'is a valid US local phone number'
    else:
        print test_string, 'has been rejected'

