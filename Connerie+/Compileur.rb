# encoding: UTF-8
require "Yaml"
require_relative "Class"
def end_rev(x)
	x.reverse[0..2]
end
def compare_rhymes(premier, second)
	end_rev(premier) <=> end_rev(second)
end
def zip_rhymes(array)
	acc = []
	while array != []
		index = 0
		char = end_rev(array[index])
		while end_rev(array[index]) == char
			index += 1
		end
		acc << [array[0...index]]
		array = array[index..-1]
	end
end
begin
	content = File.open('Mots.txt',"r"){|i| i.read}
rescue
	puts "no file Mots.txt found"
	abort
end
t1 = Time.now
content = content.split("\n").sort{|x, y| compare_rhymes(x, y)}
content = zip_rhymes(content).select{|i| i.length >= 4}
puts content[0...5].to_s
f = File.open("Dico.txt", "w")
f.write(YAML::dump(content))
f.close
t2 = Time.now  
puts t2 - t1
#liste = YAML::load(content)
