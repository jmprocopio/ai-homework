# git add .
# git commit -m 'message'
# git log

require './employee.rb'

class Department
  def initialize(name:)
    @name = name
    @employees = []
    @totalsalary = totalsalary.to_f
  end

  def name
    @name
  end

  def employees
    @employees
  end

  def totalsalary
    @totalsalary
  end

  def add_employee(a)
    @employees << a
    @totalsalary += a.salary
  end

  def give_raises(a)
    good_employees = @employees.count{ |x| x.good == true }
    each_salary = a / good_employees
    each_salary = each_salary.to_f
    @employees.each { |x|
      if x.good == true
        puts "Raise! #{x.name} was at $#{x.salary}"
        x.give_raise(each_salary)
        puts "Gets $#{each_salary}. Now at #{x.salary}"
      end
    }
  end

end
