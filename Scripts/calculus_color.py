import os, argparse, fileinput

COLOR = ['lightgray', 'gray', 'blue', 'teal']

def tester(choices,fname):
    ext = os.path.splitext(fname)[1][1:]
    if ext not in choices:
       parser.error("File extention must be {}".format(choices))
    return fname

def main():
	parser = argparse.ArgumentParser(description='Change color of additional text from thesis\n')
	parser.add_argument('--new', choices=COLOR, help='New color from COLOR list', required=True)
	parser.add_argument('--old', choices=COLOR, help='Old color from COLOR list', required=True)
	parser.add_argument('--source', help='TeX source file', type=lambda s:tester(('tex'),s), required=True)
	args = parser.parse_args()

	file = open(args.source, 'r+')
	for line in fileinput.input(args.source):
		file.write(line.replace(args.old, args.new))
	file.close()

if __name__ == "__main__":
	main()
