import sys

nargs = len(sys.argv) - 1
if nargs < 5:
    print('\nUsage : bvecs_swap <bvecsfile1> <a> <b> <c> <bvecsfile2> \n\n')
    print(' where a,b,c represent the new x,y,z axes in terms of the old axes.\n  They can take values of -x,x,y,-y,z,-z')
    print(' e.g.  bvecs_swap inbv y x -z outbv')
    exit()

import numpy as np

ibv   = np.loadtxt(sys.argv[1])
if ibv.shape[0] != 3:
   ibv = ibv.T
if ibv.shape[0] != 3:
   print(' bvec file must be Nx3 or 3xN')
   exit()


a,b,c  = sys.argv[2:5]

A,B,C    = [ v.strip('-') for v in [a,b,c]]
sA,sB,sC = [ np.sign(-int('-' in v)+.5) for v in [a,b,c]]


coords = {'x':0,'y':1,'z':2}


obv   = np.zeros_like(ibv)
obv[0,:] = ibv[ coords[A], : ] * sA
obv[1,:] = ibv[ coords[B], : ] * sB
obv[2,:] = ibv[ coords[C], : ] * sC

np.savetxt(sys.argv[5],obv)
