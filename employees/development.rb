require './department.rb'

#Create a new deaprtment
ds = Department.new(name: 'DS')
puts "Created a new department called #{ds.name}"

#Create new employees
colin = Employee.new(name: 'Colin', email: 'colin@automatedinsights.com', phone: '919-111-1111', salary: 50000, review: '', good: false)
carly = Employee.new(name: 'Carly', email: 'carly@automatedinsights.com', phone: '919-222-2222', salary: 60000, review: '', good: false)
hunter = Employee.new(name: 'Hunter', email: 'hunter@automatedinsights.com', phone: '919-333-3333', salary: 70000, review: '', good: false)

#Add an employee to a department
ds.add_employee(colin)
ds.add_employee(carly)
ds.add_employee(hunter)
puts "Added employees to #{ds.name}"
#p ds.employees

#Get an employee's name
puts "Here is #{colin.name}'s name"

#Get an employee's salary
puts "His salary is $#{colin.salary}"

#Get a department's name
puts "The name of that department again is #{ds.name}"

#Get a total salary for all employees in a department
puts "The total salary for #{ds.name} is $#{ds.totalsalary}"

#Add some review text to an employee
colin.add_review("Good.\nMaybe great.")
puts "#{colin.name}'s 2-paragraph review is as follows:\n#{colin.review}"

#Mark satisfactory or unsatisfactory
colin.make_good
carly.make_good
puts "Is #{colin.name} a good employee? #{colin.good}"
puts "Is #{carly.name} a good employee? #{carly.good}"
puts "Is #{hunter.name} a good employee? #{hunter.good}"

#Give a raise to an individual employee
puts "We're going to give #{colin.name} a $10000.00 raise for no good reason."
colin.give_raise(10000)
puts "Now #{colin.name}'s salary is $#{colin.salary}"

#Give raises to a department's employees
puts "Now we're going to give only our good employees equal share of a $10000.00 raise budget"
ds.give_raises(10000)
