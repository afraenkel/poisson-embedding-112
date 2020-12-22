
-- a = (1, 1, 2)
a = apply(separate(",", scriptCommandLine#1), i -> value(i))
n = #a

AExt = QQ[x_1..x_n, y_1..y_n, t, xx_1..xx_n, yy_1..yy_n]

K = ideal(t, xx_1..xx_n, yy_1..yy_n)
A = AExt / K

use AExt

J1 = apply(1..n, i -> x_i - t^(a_(i - 1)) * xx_i)
J2 = apply(1..n, i -> y_i * t^(a_(i - 1)) - yy_i)
Ja = ideal(J1 | J2)

M = leadTerm groebnerBasis Ja


Inv = flatten entries lift(sub(M, AExt / K), AExt)
Inv = select(Inv, i -> i != 0)
Inv = apply(Inv, a -> promote(a, A))

-- Calculate a lifted bracket on the minimal embedding

-- S is the embedding space
-- XS is the algebra of multivectors over S
-- phi is the natural ring map pairing S and XS
embN = length Inv

S = QQ[q_1..q_embN]
XS = S[dq_1..dq_embN, SkewCommutative => true]
phi = map(XS, S, vars(XS))

-- R is the symplectic affine space with the (1,1,2)-resonance action
-- The invariants of this action are listed in "invariants"

R = S[select(gens A, i -> i != 0)]
p = map(R, A)
Inv = apply(Inv, x -> p(x))

invariantMatrix = matrix{Inv}
I = ideal(vars(S) - invariantMatrix)

use R
Q = R/I
use R

-- standard symplectic structure
Brac = (f, g) -> fold((m, n) -> m + n, 
    apply(1..n, 
        i -> diff(x_i, f) * diff(y_i, g) - diff(y_i, f) * diff(x_i, g))
    )
                
psi = f -> lift(promote(f, Q), S)


-- Br gives the monomials of a lifted bivector on S
-- Pi is the lifted bivector (the sum of the monomials)
Br = (i,j) -> lift(promote(Brac(i,j),Q),S)*phi(psi(i))*phi(psi(j))

liftedPi = fold(flatten table(Inv, Inv, Br), (i, j) -> i + j) / 2

I = ker(map(R, S, Inv))

-- ---------------------------------------------------------------------
-- print the lifted bivector to an output file
-- ---------------------------------------------------------------------


f = "../data/pi.m2"

f << "S = " << toString describe S << endl
f << "XS = " << toString describe XS << endl
f << "I = " << toString ker(map(R, S, Inv)) << endl
f <<  "liftedPi = " << toString liftedPi << endl
f << close
