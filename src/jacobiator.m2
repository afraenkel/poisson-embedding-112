{* Computes the Jacobiator and checks it vanishes
on the vanishing ideal of the quotient *}

-- load the rings S, XS
-- load the vanishing ideal I
-- load the bivector liftedPi

value get "../data/pi.m2"

coordPairs = pack(2, mingle({flatten entries vars S, flatten entries vars XS}))

safeDeg = A -> (degree promote(A,XS))_0

sBrSign = (A,B) -> (-1)^((safeDeg(A) + 1) * ((safeDeg(B) + 1)) + 1)

sBr = (A,B) -> sum(apply(coordPairs, 
        p -> diff(p_0, A) * diff(p_1, B) + sBrSign(A,B) * diff(p_0, B) * diff(p_1, A)))

jacobiator = sBr(liftedPi, liftedPi) / 2

-- check that it vanishes on quotient:

promote(jacobiator, XS / promote(I, XS)) == 0

