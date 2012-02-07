#!/usr/bin/python

import sys, os, glob
import string
os.chdir("src")

all_examples_fn="all_examples.e"

file_list = glob.glob("*_example.e")
t = "class ALL_EXAMPLES\n\n"
t += "create\n\tmake\n\n"
t += "feature {NONE} -- Initialization\n\n"
t += "\tmake\n\t\t-- Run all examples\n\t\tlocal\n\t\t\tany: ANY\n\t\tdo\n"
for f in file_list:
	if f != all_examples_fn:
		cl = f[:-2].upper()
		t += '\n\t\t\tprint ("%N%NExecute {' + cl + '} ...%N")\n'
		t += "\t\t\tcreate {%s} any.make\n" % (cl)

t += "\t\tend\n\n"
t += "end\n"

f = open (all_examples_fn, 'w');
f.write (t);
f.close ();

