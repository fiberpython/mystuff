#!/usr/local/bin/python
from progressbar import *
import time

progress = ProgressBar()
for i in progress(range(79)):
    time.sleep(0.01)

# 100% #####################

# BLUEMAC:~ bssg$ /Users/bssg/mystuff/py3/progress_bar.py
# 100% |####################################################################################################|
# BLUEMAC:~ bssg$
