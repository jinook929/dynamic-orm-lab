
[1mFrom:[0m /mnt/c/Users/jinoo/Desktop/CS/Flatiron/Development/code/phase2/dynamic-orm-lab/lib/interactive_record.rb:94 InteractiveRecord.find_by:

     [1;34m90[0m: [32mdef[0m [1;36mself[0m.[1;34mfind_by[0m(option={})
     [1;34m91[0m:   attribute = option.keys.first.to_s
     [1;34m92[0m:   value = option.values.first
     [1;34m93[0m:   sql = [31m[1;31m"[0m[31mSELECT * FROM #{self.table_name}[0m[31m WHERE #{attribute}[0m[31m = '#{value}[0m[31m'[1;31m"[0m[31m[0m
 =>  [1;34m94[0m:   binding.pry
     [1;34m95[0m:   [1;34;4mDB[0m[[33m:conn[0m].execute(sql).each {|raw|
     [1;34m96[0m:     result << [1;36mself[0m.raw_to_hash(raw)
     [1;34m97[0m:   }
     [1;34m98[0m:   [1;34m# binding.pry[0m
     [1;34m99[0m:   [1;34m# result = [][0m
    [1;34m100[0m:   [1;34m# if options[:name] && options[:grade][0m
    [1;34m101[0m:   [1;34m#   sql = "SELECT * FROM #{self.table_name} WHERE name = ? AND grade = ?"[0m
    [1;34m102[0m:   [1;34m#   DB[:conn].execute(sql, options[:name], options[:grade]).each {|raw|[0m
    [1;34m103[0m:   [1;34m#     result << self.raw_to_hash(raw)[0m
    [1;34m104[0m:   [1;34m#   }[0m
    [1;34m105[0m:   [1;34m# elsif options[:name][0m
    [1;34m106[0m:   [1;34m#   sql = "SELECT * FROM #{self.table_name} WHERE name = ?"[0m
    [1;34m107[0m:   [1;34m#   DB[:conn].execute(sql, options[:name]).each {|raw|[0m
    [1;34m108[0m:   [1;34m#     result << self.raw_to_hash(raw)[0m
    [1;34m109[0m:   [1;34m#   }[0m
    [1;34m110[0m:   [1;34m# elsif options[:grade][0m
    [1;34m111[0m:   [1;34m#   sql = "SELECT * FROM #{self.table_name} WHERE grade = ?"[0m
    [1;34m112[0m:   [1;34m#   DB[:conn].execute(sql, options[:grade]).each {|raw|[0m
    [1;34m113[0m:   [1;34m#     result << self.raw_to_hash(raw)[0m
    [1;34m114[0m:   [1;34m#   }[0m
    [1;34m115[0m:   [1;34m# end[0m
    [1;34m116[0m:   [1;34m# result[0m
    [1;34m117[0m: [32mend[0m

