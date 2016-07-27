# encoding: UTF-8
require "Yaml"
require_relative "Class"
def is_vowel(x)
	%w{a e i o u}.include?(x)
end
def vowel_end(x, i=0, found=false)
	if i == x.length
		raise "OutRange"
	elsif is_vowel(x[i])
		vowel_end(x, i + 1, true)
	elsif found
		i
	else
		vowel_end(x, i + 1, found)
	end
end
def split_syllabs(x)
	begin
		i = vowel_end(x)
		[x[0...i]] + split_syllabs(x[i..-1])
	rescue
		[x]
	end
end

begin
	content = File.open('../Mots.txt',"r"){|i| i.read}
rescue
	puts "no file Mots.txt found"
	abort
end
t1 = Time.now
content = content.split("\n")
dico = Combinaisons.new
content.each do |i|
	i = split_syllabs(i)
	i.length.times do |y|
		if y == (i.length - 1)
			dico.add(i[y], "STOP")
		else
			dico.add(i[y], i[y+1])
		end
	end
	dico.add("START", i[0])
end
#dico.hash.each_pair{|key, value| puts "#{key} ==> #{value}"}
f = File.open("Dico.txt", "w")
f.write(YAML::dump(dico))
f.close
t2 = Time.now  
puts t2 - t1
#liste = YAML::load(content)
