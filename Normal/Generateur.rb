# encoding: UTF-8
require "Yaml"
require_relative "Class"
dico = File.open("Dico.txt", "r"){|f|YAML::load(f.read)}
#dico.hash.each_pair{|key, value| puts "#{key} ==> #{value}"}
#puts (0..6).map{dico.make_pairs}.join("\n")
puts dico.make_sonnet