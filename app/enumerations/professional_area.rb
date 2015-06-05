class ProfessionalArea < EnumerateIt::Base
  associate_values :designer, :support, :programmer, :web_development, :frontend,
                   :analysis, :database_adm
end
