# Poisson Embeddings of R^6/S^1 by the (1,1,2)-resonance action.

This repo attempts to build a framework for finding embeddings of singular quotients of Poisson varieties that respects the underlying Poisson structure on the quotient.  To start with, it's only attempting to find such an embedding for the (1,1,2) circle action on the canonical 6 dimensional symplectic vector space.

# Immediate goals:
* work out possible poisson embeddings in dimensions or prove nonexistence
    - 11 (not possible)
    - 12 (not possible)
    - 13 (??)

# To Do:

## Set dimension / group action / poisson bracket more generally
* check group action is poisson
* to start: dim = 2n, {x_i,y_j} = delta_ij

- Compute invariant ring for group action: 0 <- R^2n <- R^N <- I <- 0
- Compute a lift of the poisson bracket B on R^N.
- Compute jacobiator [B,B] < I
---
- Create a general A = Sum(a_ij * w_i/\w_j) where a_ij are in I.
- check [A,A] < ?
- check [A,B] < ??
