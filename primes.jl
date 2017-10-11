# find and return primes between 1 and n
function findPrimes(n::Int)
	assert(n >= 1)
	
	isPrime = fill(true, n) # isPrime[i] will be true if i is prime, false otherwise
	isPrime[1] = false
	
	for i = 2:Int(floor(sqrt(n)))
		if isPrime[i]
			for j = div(n,i):-1:i
				if isPrime[j]
					isPrime[i*j] = false
				end
			end
		end
	end
	
	return find(isPrime)
end

using Base.Test
function testFindPrimes()
	@test findPrimes(1) == []
	@test findPrimes(20) == [2, 3, 5, 7, 11, 13, 17, 19]
end
