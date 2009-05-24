require 'rubygems'
require 'classifier'

bayes = Classifier::Bayes.new 1,0

inputs = File.open('task1.inputs').to_a#.slice(0..100)
targets = File.open('task1.targets').to_a#.slice(0..100)
testdata = File.open('task1.test').to_a#.slice(0..100)

inputs.each_with_index do |item, i|
  bayes.train targets[i].to_i, inputs[i].to_s
end

testdata.each do |i|
  result = bayes.classify i
  puts result
end
