# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

potato = User.create!({
  email: 'potato@potato.potato',
  password: 'potato'
  })

potatoprofile = Profile.create!({
  user_id: potato.id,
  username: "potato",
  summary: "I am a potato. I like to be a potato. Potato potato potato.",
  birthday: Date.today - 18.years

  })

tomato = User.create!({
  email: 'tomato@tomato.tomato',
  password: 'tomato'
  })

tomatoprofile = Profile.create!({
  user_id: tomato.id,
  username: "tomato",
  summary: "I am a tomato. I like to be a tomato. Tomato tomato tomato.",
  birthday: Date.today - 48.years

  })
