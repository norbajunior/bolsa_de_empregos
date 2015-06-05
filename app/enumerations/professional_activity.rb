class ProfessionalActivity < EnumerateIt::Base
  associate_values :information_tech, :software_development, :marketing, :tourism,
                   :hotel_business

  sort_by :none
end
