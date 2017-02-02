require 'csv'

class LoadData
#  attr_reader :data
  def initialize(filename)
    @filename = filename
  end

  def get_results
    count = 1
    goodcount = 0
    badcount = 0
    good = []
    bad = []
    CSV.foreach(@filename, :headers => true) do |row|
      badhash = {}
      errormsg = ""
      #if row[4].match(/\d{3}-\d{3}-\d{4}/)
      #if row[1].match(/\(\d{2}|\d{1}\)\(\/|-\)\(\d{2}|\d{1}\)\(\/|-\)\(\d{4}|\d{2}\)/)
      #if row[1].match(/\d{1,2}[\/-]\d{1,2}[\/-]\d{2,4}/)
      #if row[3].match(/^\w{1,}[@]\w{1,}[.]\w{1,}$/)
      if row[4].match(/\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}/) && row[1].match(/\d{1,2}[\/-]\d{1,2}[\/-]\d{2,4}/) && row[3].match(/^\w{1,}[@]\w{1,}[.]\w{1,}$/)
        good << count
        goodcount += 1
      else
        if !(row[4].match(/\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}/))
          errormsg += "phone"
        end
        if !(row[1].match(/\d{1,2}[\/-]\d{1,2}[\/-]\d{2,4}/))
          if errormsg == ""
            errormsg += "joined"
          else
            errormsg += " + joined"
          end
        end
        if !(row[3].match(/^\w{1,}[@]\w{1,}[.]\w{1,}$/))
          if errormsg == ""
            errormsg += "email"
          else
            errormsg += " + email"
          end
        end
        badhash = {"line_number" => count, "errors" => errormsg}
        bad << badhash
        badcount += 1
      end
      count += 1
    end
    puts "There are #{goodcount} valid rows"
    p good
    puts "There are #{badcount} invalid rows"
    p bad
  end
 end
