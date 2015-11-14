# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


########### Utilisateurs ###############

User.create([{ nom: 'Duck',
              email: 'donald@email.com',
              pseudo:'donald',
              prenom: 'Donald',
              password: 'aaaaaaaa' }])
              
User.create([{ nom: 'Mouse',
              email: 'mickeyd@email.com',
              pseudo:'Mickou',
              prenom: 'Mickey',
              password: 'aaaaaaaa' }])

User.create([{ nom: 'Starck',
              email: 'ironman@email.com',
              pseudo:'ironman',
              prenom: 'Tony',
              password: 'aaaaaaaa' }])

User.create([{ nom: 'Banner',
              email: 'hulk@email.com',
              pseudo:'Hulk',
              prenom: 'Bruce',
              password: 'aaaaaaaa' }])

User.create([{ nom: 'Wayne',
              email: 'batmand@email.com',
              pseudo:'Batman',
              prenom: 'Bruce',
              password: 'aaaaaaaa' }])