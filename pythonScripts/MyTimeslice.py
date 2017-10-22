# My Time slice

import timeit

list_test = timeit.timeit(stmt="[1,2,3,4,5]",
							number=1000000)

tuple_test = timeit.timeit(stmt="(1,2,3,4,5)", number=1000000)

print("List time took: ", list_test)
print("tuple_test took: ", tuple_test)

