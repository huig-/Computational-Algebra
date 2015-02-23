# Ignacio Gago Padreny <igago@ucm.es>
# license GPL

"""
 Computes the gcd of two elements a,b which can be defined as integers, complex numbers or any type SAGE supports.

"""

def euclid_algorithm(a,b):
    r, r1 = a, b;
    while r1 != 0 :
	r2 = r.quo_rem(r1)[1];
	r0, r1 = r1,r2;
    return r0

# Complex numbers
a, b = CC(i),CC(1+i)

# Integer numbers
#a , b = 12, 28

# Polynomial over Z[x]
#R.<t> = ZZ['t']
#a = t**2 + 2*t + 1
#b = t + 1

print euclid_algorithm(a,b)

