#!/usr/bin/python

import sys, os, glob
import string

all_examples_fn="all_examples.e"

t = "class ALL_EXAMPLES\n\n"
t += "create\n\tmake\n\n"
t += "feature {NONE} -- Initialization\n\n"
t += "\tmake\n\t\t-- Run all examples\n\t\tlocal\n\t\t\tany: ANY\n\t\tdo\n"
def get_example_class_names(dn, lst):
	os.chdir(dn)
	file_list = glob.glob("*_example.e")
	for f in file_list:
		print f
		lst.append(f)

	file_list = os.listdir(".")
	for f in file_list:
		if os.path.isdir(f):
			get_example_class_names (f, lst)
	os.chdir("..")

lst = []
get_example_class_names("src", lst)
for f in lst:
	print "CLASS " + f
	if f != all_examples_fn:
		cl = f[:-2].upper()
		t += '\n\t\t\tprint ("%N%NExecute {' + cl + '} ...%N")\n'
		t += "\t\t\tcreate {%s} any.make\n" % (cl)

t += "\t\tend\n\n"
t += "end\n"

f = open (os.path.join ("src", all_examples_fn), 'w');
f.write (t);
f.close ();

