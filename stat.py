#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys

agg = {'insert': 0, 'deleted': 0, 'files': set()}
for line in sys.stdin.readlines():
    try:
        ins, delete, file_name = line.split('\t', 2)
    except ValueError:
        continue
    agg['insert'] += int(ins)
    agg['deleted'] += int(delete)
    agg['files'].add(file_name.strip())


agg['files'] = len(agg['files'])
print('A:{insert}\tD:{deleted}\tFiles:{files}'.format(**agg))
