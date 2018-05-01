def gen_prime():
	p = random_prime(2^16, False, 997)
	q = primitive_root(p)
	print "Public Prime 'p'   : " + str(p)
	print "Primitive Root 'q' : " + str(q)
	return [p, q]
	
def gen_keys(q, p):
	a = randint(1, p)
	A = mod((q^a), p)
	print "Private Key 'a' : " + str(a)
	print "Public Key 'A'  : " + str(A)
	return [a, A]
	
def txt_to_num(msg):
	indices = [ord(i) for i in msg]
	return ZZ(indices, 256)

def num_to_txt(num):
	indices = num.digits(256)
	return ''.join([chr(i) for i in indices])
	
def sign(p, a, A, B, msg):
	for x in xrange(1, p-1):
		if gcd(x, p-1) == 1:
			k = x
			break
	k = mod(k, p-1)		
	r = mod((a^k), p)
	s = (msg-A*r)/k
	
	print " 'k' : " + str(k)
	print " 'r' : " + str(k)
	print " 's' : " + str(k)
	return [k, r, s]
	
def verify_sign(p, a, B, r, s, msg):
	tmp1 = mod((B^r), p)
	tmp2 = mod((r^s), p)
	tmp3 = mod(tmp1*tmp2, p)
	tmp4 = mod((a^msg), p)
	
	if tmp3 == tmp4:
		return true
	return false