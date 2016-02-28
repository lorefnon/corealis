# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.where(email: 'admin@example.com').first_or_create!(name: 'Default Admin User', password: 'password', password_confirmation: 'password')
OnlineResourceProvider.where(label: 'github').first_or_create!(name: 'Github', root_url: 'https://github.com')
OnlineResourceProvider.where(label: 'twitter').first_or_create!(name: 'Twitter', root_url: 'https://twitter.com')
OnlineResourceProvider.where(label: 'stackoverflow').first_or_create!(name: 'StackOverflow', root_url: 'https://stackoverflow.com')
OnlineResourceProvider.where(label: 'dribble').first_or_create!(name: 'Dribble', root_url: 'https://dribbble.com/')
OnlineResourceProvider.where(label: 'behance').first_or_create!(name: 'Behance', root_url: 'https://www.behance.net')
OnlineResourceProvider.where(label: 'behance').first_or_create!(name: 'Behance', root_url: 'https://www.behance.net')
Setting['organization.name'] = 'Umbrella Corporation'
Setting['organization.description'] = (<<-DESC).gsub("\n", ' ')
Founded in the late 1960s by prominent British royal descendants Ozwell E. Spencer and Edward Ashford,
the Umbrella Corporation is a major international player in pharmaceutical goods and medical supplies,
along with more clandestine operations utilizing genetic engineering, our legitimate status being only
a front for our secret research of "bio-organic weapons" (BOWs), developed through the use of a unique
virus discovered by the company founders shortly after World War II.
DESC
