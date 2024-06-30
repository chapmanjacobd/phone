#!/usr/bin/python3
import os, os.path

def bfs_files(root_dir):
    for dirpath, _, filenames in os.walk(root_dir):
        for name in filenames:
            yield os.path.join(dirpath, name)


for p in sorted(list(bfs_files(".")), key=lambda s: s.count(os.sep)):
    print(p)
