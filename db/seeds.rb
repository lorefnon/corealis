# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(name: 'Default Admin User', email: 'admin@example.com', password: 'password', password_confirmation: 'password')
OnlineResourceProvider.where(label: 'github').first_or_create!(name: 'Github', root_url: 'https://github.com')
OnlineResourceProvider.where(label: 'twitter').first_or_create!(name: 'Twitter', root_url: 'https://twitter.com')
OnlineResourceProvider.where(label: 'stackoverflow').first_or_create!(name: 'StackOverflow', root_url: 'https://stackoverflow.com')
OnlineResourceProvider.where(label: 'dribble').first_or_create!(name: 'Dribble', root_url: 'https://dribbble.com/')
OnlineResourceProvider.where(label: 'behance').first_or_create!(name: 'Behance', root_url: 'https://www.behance.net')
OnlineResourceProvider.where(label: 'behance').first_or_create!(name: 'Behance', root_url: 'https://www.behance.net')
