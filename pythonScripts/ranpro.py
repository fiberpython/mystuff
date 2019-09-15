import mem_profile
import random
import time

name = ['John', 'Corey', 'Adam', 'Steve', 'Terrance', 'Thomas']
majors = ['Math', 'Engineering', 'CompSci', 'Arts', 'Business']

print 'Memory (Before): {}Mb'.format(mem_profile.memory_usage_resource())

def people_list(num_people):
    result = []
    for i in range(num_people):
        person = {
                    'id': i,
                    'name': random.choice(names),
                    'major': random.choice(majors)
                 }
        result.append(person)
    return result

        }