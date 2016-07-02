# encoding: UTF-8
require "Yaml"
require_relative "Class"
dico = File.open("Dico.txt", "r"){|f|YAML::load(f.read)}
#dico.hash.each_pair{|key, value| puts "#{key} ==> #{value}"}
puts dico.make_pairs