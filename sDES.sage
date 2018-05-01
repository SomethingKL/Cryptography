from sage.crypto.block_cipher.sdes import SimplifiedDES
sdes = SimplifiedDES()
bin = BinaryStrings()

def txt_to_num(msg):
	indices = [ord(i) for i in msg]
	return ZZ(indices, 256)

def num_to_txt(num):
	indices = num.digits(256)
	return ''.join([c(i) for i in indices])

def encrypt_sDES(msg, key):
	plain_txt = bin.encoding(str(msg))
	tmp = key.digits(base=2, padto=10)
	tmp.reverse()
	bin_key = sdes.list_to_string(tmp)
	
	cipher_text = sdes(plain_txt, bin_key, algorithm="encrypt")
	print "Encrypted Message : " + str(cipher_text)
	return cipher_text
	
def decrypt_sDES(txt, key):
	tmp = key.digits(base=2, padto=10)
	tmp.reverse()
	bin_key = sdes.list_to_string(tmp)
	
	plain_txt = sdes(txt, bin_key, algorithm="decrypt")
	print "Decrypted Message : " + str(plain_txt)
	return plain_txt