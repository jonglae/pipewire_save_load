 #!/bin/python

import sys
import csv
import os

if len(sys.argv) < 2:
	print('\n usage: pw-loadwires filename\n')
	quit()

with open(sys.argv[1], newline='') as csvfile:
	pwwreader = csv.reader(csvfile, delimiter=',', quotechar='"')
	for row in pwwreader:
		print('Loading:  ' + row[0] + ' --> ' + row[1])
		process = os.popen('pw-link ' + row[0] + ' ' + row[1])
