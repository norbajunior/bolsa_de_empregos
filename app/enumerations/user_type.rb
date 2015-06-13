class UserType < EnumerateIt::Base
  associate_values backoffice: 'Backoffice', entity: 'Entity', candidate: 'Candidate'
end
