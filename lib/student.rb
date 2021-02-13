require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord
### Custom Method :  # => w/ sqlite3-1.3.13
# from {:id => 1, :name=>"Tim", :grade=>9, 0 => 1, 1 => "Tim", 2 => 9}
# to {:id => 1, :name=>"Tim", :grade=>9}
  # def self.all_raws
  #   DB[:conn].execute("SELECT * FROM students").map {|student|
  #     student
  #   }
  # end

  self.column_names.each {|col_name|
    attr_accessor(col_name)
  }
end
