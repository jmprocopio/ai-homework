class Employee
  def initialize(name:, email:, phone:, salary:, review:, good:)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = review
    @good = good
  end

  def name
    @name
  end

  def email
    @email
  end

  def phone
    @phone
  end

  def salary
    @salary.to_f
  end

  def review
    @review
  end

  def good
    @good
  end

  def add_review(a)
    @review = a
  end

  def make_good
    @good = true
  end

  def give_raise(a)
    @salary += a.to_f
  end

end
