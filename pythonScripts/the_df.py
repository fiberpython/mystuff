import subprocess

dfh=subprocess.check_output("df -h |grep '[0-9]%'", shell=True)
df_output_lines = [s.split() for s in dfh.splitlines()]
how_many_lines = dfh.count("\n")


for x in range(how_many_lines):
	fsmb = df_output_lines[x].pop()
	prsb = df_output_lines[x].pop()
	print ("Filesystem {%d} is {%d}") % (fsmb, prsb)

#print "filesystem {fsb} is {pcbb} full \n".format(fsb=fsmb, pcbb=prsb)


		# % (1, 'dead')
