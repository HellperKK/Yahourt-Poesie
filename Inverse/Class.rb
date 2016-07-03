require_relative "../MegaClass"
class Combinaisons < MegaCombinaisons
	attr_reader :hash
	def make_word(char = "START", limit = rand(3..7), acc = "")
		mot = find_next(char)
		if (mot == "STOP") || (acc.length == limit)
			acc
		else
			make_word(mot, limit, mot + acc)
		end
	end
	def make_sentence(limit = rand(15..35), acc = "")
		phrase = make_word + " " + acc
		if phrase.length >= limit
			phrase
		else
			make_sentence(limit, phrase)
		end
	end
end
