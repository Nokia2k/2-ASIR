#!/usr/bin/python3

import time
import os
import random

fre = 2500
dur = 1000

while True:
    os.system('play --no-show-progress --null synth 0.1 vol 5 &>/dev/null')
    time.sleep(random.randint(0,60))
     