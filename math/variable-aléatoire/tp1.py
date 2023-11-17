#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Nov 17 13:27:27 2023

@author: p22008750 / Angelo P.
"""

import random

def bernoulli(p):
    U = (random.random())
    if (U <= p):
        return 1
    else:
        return 0
    
def binomial(n, p):
    sucess = 0
    for i in range(0, n):
        if (bernoulli(p) == 1):
           sucess += 1
    return sucess
    
def geometrique(p):
    rang = 1
    while(not bernoulli(p)):
        rang += 1
    return rang

def poisson(a):
    n = 5000
    return binomial(n, a/n)

print(bernoulli(0.5))

print(binomial(30, 0.5))

print(geometrique(0.0001))

print(poisson(5))

#%%

import matplotlib.pyplot as mp
import matplotlib.ticker

def generateTabRandom():
    V = []
    for i in range(1000):
        V.append(random.random())
    return V

locator = matplotlib.ticker.MultipleLocator(1)
mp.gca().xaxis.set_major_locator(locator)
formatter = matplotlib.ticker.StrMethodFormatter("{x:.0f}")
mp.gca().xaxis.set_major_formatter(formatter)

mp.hist([1, 2, 1, 4, 0, 1, 0], density=True, align='left', hatch='x', edgecolor='darkgray', color='darkred', bins=5, range=[0,5])