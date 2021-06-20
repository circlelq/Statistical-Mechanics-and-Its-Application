# !/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021-06-19
# @Author  : yuanleiqi
# @File    : Ising.py

import numpy as np
import matplotlib.pyplot as plt
from math import *
import random
from matplotlib import rcParams

ave_sig = np.load('ave_sig.npy')
print(ave_sig)

config = {
    "font.family": 'DejaVu serif',
    "font.size": 30,
    "mathtext.fontset": 'stix',
    "font.serif": ['SimSong-Regular'],
}

rcParams.update(config)

figsize = 12, 9
figure, ax = plt.subplots(figsize=figsize)
ax.spines['bottom'].set_linewidth(2)
ax.spines['left'].set_linewidth(2)
ax.spines['right'].set_linewidth(2)
ax.spines['top'].set_linewidth(2)
plt.tick_params(labelsize=30)
labels = ax.get_xticklabels() + ax.get_yticklabels()
[label.set_fontname('Times New Roman') for label in labels]
plt.plot([0.1, 0.2, 0.5, 1, 2], ave_sig[1, :])
plt.xlabel(r'$T$')
plt.ylabel(r'$<\sigma_i>$')
# plt.title(r'Block, $T=$'+str(T)+'$,\ J=$'+str(J))
plt.tight_layout()
# plt.savefig('fig/ave_b'+'J'+str(J)+'.pdf')
plt.show()
