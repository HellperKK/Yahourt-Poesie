require_relative "../MegaClass"
class Combinaisons < MegaCombinaisons
	attr_reader :hash
	def make_word(char = "START", limit = rand(3..7), acc = "")
		mot = find_next(char)
		if (mot == "STOP") || (acc.length == limit)
			acc
		else
			make_word(mot, limit, acc + mot)
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
	def make_sentence_rhymes(sentence)
		fin = sentence.split(" ")[-1]
		make_sentence(rand(10..30)) + fin
	end
end
