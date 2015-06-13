# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
ActiveRecord::Base.transaction do
  u = Backoffice.new({
    name: 'Backoffice',
    email: 'backoffice@bolsademprego.pt',
    password: '123456',
    password_confirmation: '123456'
  })

  u.save(validate: false)

  Candidate.create!(
    30.times.map do
      {
        email: Faker::Internet.email,
        date_of_birth: Faker::Date.between(40.years.ago, 20.years.ago),
        password: '123456',
        password_confirmation: '123456',
        name: Faker::Name.name,
        identity_number: Faker::Number.number(10),
        address: Faker::Address.street_address,
        zipcode: Faker::Address.zip_code,
        place: Concelhos.list.sample,
        remote_photo_url: Faker::Avatar.image,
        site: Faker::Internet.url,
        education: Faker::Lorem.paragraph(50),
        remote_cv_url: 'https://dl.dropboxusercontent.com/u/9078605/curriculum-vitae-modelo1-oscuro.pdf',
        presentation: Faker::Lorem.paragraph(50),
        professional_area: ProfessionalArea.list.sample,
        scholarity: Scholarity.list.sample,
        employment_status: EmploymentStatus.list.sample,
        contact: Faker::PhoneNumber.phone_number,
        other_contact: Faker::PhoneNumber.cell_phone,
        experience: Faker::Lorem.paragraph(50)
      }
    end
  )

  Entity.create({
    email: 'geral@wiremaze.com',
    password: '123456',
    password_confirmation: '123456',
    name: 'Wiremaze',
    address: 'Edifício Capitólio - Torre Venetto Av. França 256, Piso 6, Sala 6.8',
    zipcode: '4050-476',
    place: 'Porto',
    site: 'http://wiremaze.com',
    remote_photo_url: 'https://s3.amazonaws.com/f.cl.ly/items/0n26012A3s1y2b0Y3g3Q/Screenshot%202015-06-08%2023.55.01.png',
    nif: '1234567',
    professional_activity: 'Software Development',
    presentation: 'Criamos soluções que ajudam os nossos clientes a ultrapassar os seus desafios de forma simples.',
    contact: '(+351) 228 328 813',
    other_contact: '(+351) 228 328 823'
  })

  entities = Entity.create!(
    20.times.map do
      {
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456',
        name: Faker::Company.name,
        address: Faker::Address.street_address,
        zipcode: Faker::Address.zip_code,
        place: Concelhos.list.sample,
        remote_photo_url: Faker::Company.logo,
        site: Faker::Internet.url,
        nif: Faker::Number.number(9),
        professional_activity: ProfessionalActivity.list.sample,
        presentation: Faker::Lorem.paragraph(3),
        contact: Faker::PhoneNumber.phone_number,
        other_contact: Faker::PhoneNumber.cell_phone
      }
    end
  )

  News.create(
    30.times.map do
      {
        title: Faker::Hacker.say_something_smart,
        date: Faker::Date.between(2.days.ago, Date.today),
        summary: Faker::Lorem.paragraph(20),
        text: Faker::Lorem.paragraph(10),
        featured: true,
        active: true,
        remote_image_url: Faker::Company.logo,
        user: u
      }
    end
  )

  Offer.create!(
    40.times.map do
      entity = entities.sample

      {
        title: Faker::Name.title,
        start_at: Date.current,
        end_at: 30.days.from_now,
        description: Faker::Lorem.paragraph(20),
        remote_photo_url: Faker::Company.logo,
        entity_id: entity.id,
        professional_activity: entity.professional_activity,
        contract: Contract.list.sample,
        salary: Salary.list.sample,
        active: true
      }
    end.concat(
      10.times.map do
        entity = entities.sample

        {
          title: Faker::Name.title,
          start_at: Date.current,
          end_at: 30.days.from_now,
          description: Faker::Lorem.paragraph(4),
          remote_photo_url: Faker::Company.logo,
          entity_id: entity.id,
          professional_activity: entity.professional_activity,
          contract: Contract.list.sample,
          salary: Salary.list.sample,
          active: false
        }
      end
    )
  )
end
