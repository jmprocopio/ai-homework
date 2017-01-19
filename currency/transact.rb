require './conversion.rb'

#Create currency objects
curr1 = Currency.new(1.00, 'USD')
curr2 = Currency.new(1.00, 'USD')
curr3 = Currency.new(2.00, 'USD')
curr4 = Currency.new(1.00, 'EUR')

puts "Created curr1 with $#{curr1.amount} in #{curr1.code}."
puts "Created curr2 with $#{curr2.amount} in #{curr2.code}."
puts "Created curr3 with $#{curr3.amount} in #{curr3.code}."
puts "Created curr4 with $#{curr4.amount} in #{curr4.code}."

#Show equality
puts "curr1 should equal curr2 and that is #{curr1.is_equal?(curr2)}."
puts "curr1 should NOT equal curr3 and that is #{curr1.is_equal?(curr3)}."
puts "curr1 should NOT equal curr4 and that is #{curr1.is_equal?(curr4)}."

#Let's add if they are the same code and block if the are not
puts "Added, curr1 and curr2 are #{curr1.add(curr2)}."
puts "Can't add curr1 and curr4 so #{curr1.add(curr4)}"

#Let's subtract if they are the same code and block if the are not
puts "curr1 less curr2 is #{curr1.subtract(curr2)}."
puts "Can't subtract curr1 and curr4 so #{curr1.subtract(curr4)}"

#Mulitply by float and return the object
curr1.multiply(1.1)
puts "When we multiply by 1.1, curr1 becomes #{curr1.amount}."

#Take something with symbol and get the amount and code
curr5 = Currency.new("$1.00")
puts "Created curr5 as $1.00 and set the amount and code to $#{curr5.amount} in #{curr5.code}."

convcurr1 = CurrencyConverter.new()
puts "curr1 converted to its same currency is #{convcurr1.convert(curr1, "USD")}."
puts "curr1 converted to EUR is #{convcurr1.convert(curr1, "EUR")}."
puts "curr4 converted to YEN is #{convcurr1.convert(curr4, "JPY")}."
puts "curr4 converted to SPB (SpaceBucks) is #{convcurr1.convert(curr4, "SPB")}."
