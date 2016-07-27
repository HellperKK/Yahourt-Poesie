class MegaCombinaisons
	attr_reader :hash
	def initialize
		@hash = Hash.new{[]}
	end
	def add(key, value)
		@hash[key] = @hash[key]
		index = @hash[key].find_index{|k| k[0] == value}
		if index != nil
			couple = @hash[key][index]
			@hash[key][index][1] += 1
		else
			@hash[key] << [value, 1]
		end
	end
	def to_s
		@hash.to_s
	end
	def pick_random(paires, random, acc = 0, index = 0)
		acc += paires[index][1]
		if random <= acc
			paires[index][0]
		else
			pick_random(paires, random, acc, index + 1)
		end
	end
	def find_next(char)
		paires = @hash[char]
		max = paires.map{|i| i[1]}.reduce(:+)
		random = rand(0..(max-1))
		pick_random(paires, random, acc = 0, index = 0)
	end
	def make_sentence_rhymes(sentence)
		fin = sentence.split(" ")[-1]
		make_sentence(rand(10..30)) + fin
	end
	def make_pairs
		phrase = make_sentence
		phrase + "\n" + make_sentence_rhymes(phrase)
	end
	def make_sonnet
		rimes = (0..4).map{make_sentence}
		[
			make_sentence_rhymes(rimes[0]),
			make_sentence_rhymes(rimes[1]),
			make_sentence_rhymes(rimes[1]),
			make_sentence_rhymes(rimes[0]),
			"",
			make_sentence_rhymes(rimes[0]),
			make_sentence_rhymes(rimes[1]),
			make_sentence_rhymes(rimes[1]),
			make_sentence_rhymes(rimes[0]),
			"",
			make_sentence_rhymes(rimes[2]),
			make_sentence_rhymes(rimes[2]),
			make_sentence_rhymes(rimes[3]),
			"",
			make_sentence_rhymes(rimes[4]),
			make_sentence_rhymes(rimes[4]),
			make_sentence_rhymes(rimes[3])
		].join("\n")
	end
end
