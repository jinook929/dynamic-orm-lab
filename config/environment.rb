require 'sqlite3'
require 'pry'

DB = {:conn => SQLite3::Database.new("db/students.db")}
DB[:conn].execute("DROP TABLE IF EXISTS students")

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
  id INTEGER PRIMARY KEY, 
  name TEXT, 
  grade INTEGER
  )
SQL

DB[:conn].execute(sql)
DB[:conn].results_as_hash = true

# sql1 = "INSERT INTO students (name, grade) VALUES ('Tom', 9)"
# sql2 = "INSERT INTO students (name, grade) VALUES ('Ben', 10)"
# sql3 = "INSERT INTO students (name, grade) VALUES ('Kim', 11)"
# sql4 = "INSERT INTO students (name, grade) VALUES ('Man', 12)"
# DB[:conn].execute(sql1)
# DB[:conn].execute(sql2)
# DB[:conn].execute(sql3)
# DB[:conn].execute(sql4)

# binding.pry
""