# Ignacio Gago Padreny <igago@ucm.es>
# license GPL

#Auxiliar method to compute Bezouts identity as+bt = gcd(a,b)
def euclids_extended(a,b):
    r0, r1 = a, b
    s, s1 = 1, 0
    t, t1 = 0, 1
    while r1 != 0 :
        q, r2 = r0.quo_rem(r1)
        r0, s, t, r1, s1, t1 = r1, s1, t1, r2, s-s1*q, t-t1*q
    return r0, s, t

#Computes in Zn the modular inverse of b
def modular_inverse(b,n):
    gcd, x, _ = euclids_extended(b,n)
    if gcd != 1 :
	print b,"does not have a multiplicative inverse modulo",n
	return -1
    if x >= 0 :
	return x
    else :
	return x + n

#Effective Chinese Remainder theorem. 
"""
 Given integer n1,...,nk and a1,...,ak where {n_i} is pairwise relatively prime, and 0 <= a_i < n_i for i = 1,...,k, the algorithm returns the unique integer a satisfying 0 <= a < n and a mod n_i = a_i mod n_i for i = 1,...,k
"""

def chinese_remainder(N,A) :
    n = 1
    e = []
    for i in range(0, len(N)):
	n = n * N[i]
    for i in range(0, len(N)):
	n_star = n.quo_rem(N[i])[0] 
	b = n_star.quo_rem(N[i])[1]
	t = modular_inverse(b,N[i])
	e.append(n_star * t)
    a = 0
    for i in range(0,len(N)):
	a = (a + A[i]*e[i])
    a = a.quo_rem(n)[1]
    return a

#Chinese remainder
N = [2,3,5]
A = [2,3,4]
print chinese_remainder(N,A)

