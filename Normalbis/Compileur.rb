# encoding: UTF-8
require "Yaml"
require_relative "Class"
def search_words(str) 
	str.split("\n")
	#str.split("\n").map{|i| }.uniq
end
def to_hash_table(liste)
	hash = Hash.new([])
	listebis = double_list(liste)
	listebis.each{|i| hash[i[0]] += [i[1]]}
	hash
end
begin
	content = File.open('Mots.txt',"r"){|i| i.read}
rescue
	puts "no file Mots.txt found"
	abort
end
t1 = Time.now
content = search_words(content)
dico = Combinaisons.new
content.each do |i|
	i.length.times do |y|
		if y == (i.length - 1)
			dico.add([i[y], "STOP"], "STOP")
		elsif y == (i.length - 2)
			dico.add([i[y], i[y+1]], "STOP")
		else
			dico.add([i[y], i[y+1]], i[y+2])
		end
	end
	if i.length == 1
		dico.add(["START", i[0]], "STOP")
	else
		dico.add(["START", i[0]], i[1])
	end
end
#dico.hash.each_pair{|key, value| puts "#{key} ==> #{value}"}
f = File.open("Dico.txt", "w")
f.write(YAML::dump(dico))
f.close
t2 = Time.now  
puts t2 - t1
#liste = YAML::load(content)