require_relative 'MaxIntSet'

#---------------------------
p "---- MaxIntSet ----"
max_int_set = MaxIntSet.new(4)
max_int_set.insert(0)
max_int_set.insert(2)
p max_int_set
max_int_set.insert(3)
p max_int_set
begin
    max_int_set.insert(4)
rescue StandardError => e
    p "#{e.message}"
end
p max_int_set
