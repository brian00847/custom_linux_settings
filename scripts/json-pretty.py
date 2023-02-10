#!/usr/bin/python3

import json,sys

def pretty_print(jsonfile):
    fin = open(jsonfile, 'r')
    raw_json_str = json.load(fin)
    pretty_json_str = json.dumps(raw_json_str, sort_keys=True, indent=2)
    print(pretty_json_str)

def usage(progname):
    sys.stderr.write("{} <infile>\n".format(progname))

def main():
    if len(sys.argv) != 2:
        usage(sys.argv[0])
        return 1

    jsonfile = sys.argv[1]
    pretty_print(jsonfile)
    return 0

sys.exit(main())


