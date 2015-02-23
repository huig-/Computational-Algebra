# Ignacio Gago Padreny <igago@ucm.es>
# license GPL

"""
 Computes the gcd of two elements a,b which are not necessarily integers. It also returns the coefficients of Bezout identity, that is elements x and y such that ax+by=gcd(a,b).
"""

def euclids_extended(a,b):
    r0, r1 = a, b
    s, s1 = 1, 0
    t, t1 = 0, 1
    while r1 != 0 :
	q, r2 = r0.quo_rem(r1)
	r0, s, t, r1, s1, t1 = r1, s1, t1, r2, s-s1*q, t-t1*q
    return r0, s, t

#Integers
#a,b = 12, 18

#Polynomials over Z
R.<t> = ZZ['t']
a = t**2+5*t+6
b = t**2+4*t+4

print euclids_extended(a,b)

