#Factor n-1 as t*2**h
def find_t_h(n):
    t = n-1
    h = 0
    while not (t & 1) :
	t = t >> 1
	h = h + 1
    return t, h

#Miller-Rabin primality test
def miller_rabin(n):
    t, h = find_t_h(n)
    alpha = (ZZ.random_element()).quo_rem(n)[1]
    beta = (alpha**t).quo_rem(n)[1]
    if beta == 1 :
	return True
    for j in range(0,h-1):
	if beta == n-1 :
	    return True
	if beta == 1 :
	    return False
	beta = (beta**2).quo_rem(n)[1] 
    return False

print miller_rabin(17)
