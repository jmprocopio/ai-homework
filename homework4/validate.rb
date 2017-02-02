require './load_data.rb'

validate = LoadData.new('homework.csv')
puts validate.get_results
