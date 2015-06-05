class Scholarity < EnumerateIt::Base
  associate_values :secondary, :technological, :normal_degree, :bacharel, :master,
                   :doctorate

  sort_by :none
end
