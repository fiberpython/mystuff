import re
for test_string in ['212-536-8416', '212-1LL-EGAL']:

    if re.match(r'^\d{3}-\d{3}-\d{4}$', test_string):
    	
<<<<<<< .merge_file_YGUKNZ
        print test_string, 'is a valid US local phone number'
=======
        print test_string, 'is really a valid US local phone number'
>>>>>>> .merge_file_guyJR5
    else:
        print test_string, 'has been rejected'

