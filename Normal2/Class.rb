require_relative "../MegaClass"
class Combinaisons < MegaCombinaisons
	attr_reader :hash
	def make_word(char = ["START", random_char], limit = rand(3..7), acc = "")
		mot = find_next(char)
		if (mot == "STOP") || (acc.length == limit)
			acc + char[1]
		else
			make_word([char[1], mot], limit, acc + char[1])
		end
	end
	def make_sentence(limit = rand(15..35), acc = "")
		phrase = acc + " " + make_word
		if phrase.length >= limit
			phrase
		else
			make_sentence(limit, phrase)
		end
	end
	def random_char
		("a".."z").to_a[rand(0..25)]
	end
end
