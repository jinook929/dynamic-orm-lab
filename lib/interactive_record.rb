require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

### Custom Method :  # => for sqlite3-1.3.13
# from {:id => 1, :name=>"Tim", :grade=>9, 0 => 1, 1 => "Tim", 2 => 9}
# to {:id => 1, :name=>"Tim", :grade=>9}
  def self.raw_to_hash(row)
    Hash.new.tap {|hash|
      row.each {|k, v|
        hash[k] = v unless k.to_s.match(/^\d+$/)
      }
    }
    # hash = {}
    # row.each {|k, v|
    #   hash[k] = v unless k.to_s.match(/^\d+$/)
    # }
    # hash
  end

### Custom Method
  def self.all_to_hash
    raw = DB[:conn].execute("SELECT * FROM #{table_name}").map {|student|
      student
    }
    students = []
    raw.map {|row| students << self.raw_to_hash(row)}
    students
  end

### Custom Method
  def self.all
    DB[:conn].execute("SELECT * FROM #{table_name}").map {|row|
      self.new(self.raw_to_hash(row))
    }
  end

  def self.table_name
    "#{self.to_s.downcase}s"
  end

  def self.column_names
    sql = "PRAGMA table_info( '#{self.table_name}' );"
    DB[:conn].execute(sql).collect {|hash|
      hash["name"]
    }
  end

  def initialize(options={})
    options.each {|key, value|
      self.send("#{key}=", value)
    }
  end

  def table_name_for_insert
    self.class.table_name
  end

  def col_names_for_insert
    self.class.column_names[1..-1].join(", ")
  end

  def values_for_insert
    values = self.col_names_for_insert.split(", ").collect {|col_name|
      self.send("#{col_name}")
    }
    values.collect {|value|
      "'#{value}'"
    }.join(", ")
  end

  def save
    sql =<<~SQL
    INSERT INTO #{table_name_for_insert} (#{col_names_for_insert})
    VALUES (#{values_for_insert})
    SQL
    DB[:conn].execute(sql)
    
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{table_name_for_insert}")[0][0]
    
    self
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM #{self.table_name} WHERE name = ?"
    row = DB[:conn].execute(sql, name) # => w/ sqlite3-1.4.2
    # [] << self.raw_to_hash(row[0]) # => should be added for sqlite3-1.3.13
  end

  def self.find_by(option={})
    value = option.values.first.class == Integer ? option.values.first : "#{option.values.first}"
    # value = option.values.first.class == Fixnum ? option.values.first : "#{option.values.first}"

    sql = "SELECT * FROM #{self.table_name} WHERE #{option.keys.first} = ?"
    DB[:conn].execute(sql, value) # => w/ sqlite3-1.4.2
    # DB[:conn].execute(sql, value).collect {|raw|
    #   self.raw_to_hash(raw)
    # } # => w/ sqlite3-1.3.13
  end
end