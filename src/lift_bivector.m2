-- Calculate a lifted bracket on the minimal embedding in QQ^11


-- S is the embedding space
-- XS is the algebra of multivectors over S
-- phi is the natural ring map pairing S and XS

S = QQ[q_0..q_4, c_0..c_5]
XS=S[dq_0..dq_4, dc_0..dc_5, SkewCommutative=> true]
phi = map(XS, S, vars(XS))

-- R is the symplectic affine space with the (1,1,2)-resonance action
-- The invariants of this action are listed in "invariants"

R = S[x_0..x_2, y_0..y_2]

invariants = { x_0 * y_0,
               x_1 * y_1,
               x_2 * y_2,
               x_0 * y_1, 
               x_1 * y_0,
               x_0^2 * y_2,
               x_0 * x_1 * y_2,
               x_1^2 * y_2,
               y_0^2 * x_2,
               y_0 * y_1 * x_2,
               y_1^2 * x_2
               }


invariantMatrix = matrix{invariants}
I = ideal(vars(S) - invariantMatrix)

Q = R/I

use R

-- standard symplectic structure
Brac = (f,g) -> diff(x_0, f) * diff(y_0,g) - diff(y_0, f) * diff(x_0, g) + 
                diff(x_1, f) * diff(y_1,g) - diff(y_1, f) * diff(x_1, g) + 
                diff(x_2, f) * diff(y_2,g) - diff(y_2, f) * diff(x_2, g)
                
psi = f -> lift(promote(f, Q), S)


-- Br gives the monomials of a lifted bivector on S
-- Pi is the lifted bivector (the sum of the monomials)
Br = (i,j) -> lift(promote(Brac(i,j),Q),S)*phi(psi(i))*phi(psi(j))

liftedPi = fold(flatten table(invariants, invariants, Br), (i, j) -> i + j)/2

-- ---------------------------------------------------------------------
-- print the lifted bivector to an output file
-- ---------------------------------------------------------------------


f = "../data/pi.m2"

f << "S = QQ[q_0..q_4, c_0..c_5]" << endl
f << "XS = S[dq_0..dq_4, dc_0..dc_5, SkewCommutative=> true]" << endl
f << "I = " << toString ker(map(R, S, invariants)) << endl
f <<  "liftedPi = " << toString liftedPi << endl
f << close
