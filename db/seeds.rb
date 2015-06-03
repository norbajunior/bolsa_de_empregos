# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entity.create({
  email: 'geral@wiremaze.com',
  password: '123456',
  password_confirmation: '123456',
  name: 'Wiremaze',
  address: 'Edifício Capitólio - Torre Venetto Av. França 256, Piso 6, Sala 6.8',
  zipcode: '4050-476',
  place: 'Porto',
  site: 'http://wiremaze.com',
  nif: '1234567',
  professional_activity: 'Software Development',
  presentation: 'Criamos soluções que ajudam os nossos clientes a
                 ultrapassar os seus desafios de forma simples.',
  contact: '(+351) 228 328 813',
  other_contact: '(+351) 228 328 823'
})

Candidate.create({
  email: 'norbejunior@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  name: 'Norberto Oliveira Junior',
  address: 'Largo do Priorado, 80',
  zipcode: '4050-476',
  place: 'Porto',
  site: 'http://linkedin.com/in/norbajunior',
  presentation: 'Ruby on Rails Engineer',
  contact: '(+351) 917 131 878',
  experience: '4 years working with web development',
})
