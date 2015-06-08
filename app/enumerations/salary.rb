class Salary < EnumerateIt::Base
  associate_values :first_level, :second_level, :third_level, :forth_level, :fifth_level, :sixth_level
end
