require 'rubygems'
require 'ai4r'

DATA_LABELS = ['amount', 'hour1', 'state1', 'zip1', 'field1', 'domain1', 'field2', 'hour2', 'flag1', 'total', 'field3', 'field4', 'field5', 'indicator1', 'indicator2', 'flag2', 'flag3', 'flag4', 'flag5', 'shady']


inputs = File.open('task1.inputs').to_a#.slice(0..100)
targets = File.open('task1.targets').to_a#.slice(0..100)
testdata = File.open('task1.test').to_a#.slice(0..100)

DATA_SET = []
inputs.each_with_index do |item, i|
  DATA_SET << "#{inputs[i].chomp},#{targets[i].chomp}".split(',')
end

data_set = Ai4r::Data::DataSet.new(:data_items=>DATA_SET, :data_labels=>DATA_LABELS)
id3 = Ai4r::Classifiers::Prism.new.build(data_set)

testdata.each do |i|
  res = id3.eval(i.split(','))
  unless res == "0"
    puts "1"
  else
    puts "0"
  end
end
