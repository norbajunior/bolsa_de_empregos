class Contract < EnumerateIt::Base
  associate_values :full_time, :part_time, :temporary, :trainee
end
