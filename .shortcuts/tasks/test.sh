#!/bin/bash
am start -n com.termux.api/.DialogActivity
termux-toast "$(ls ~)"
