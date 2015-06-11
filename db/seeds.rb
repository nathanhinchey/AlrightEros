# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# MOTIVATIONS
# evil = Motivation.create({
#   body: 'evil'
#   })
#
# greed = Motivation.create({
#   body: 'greed'
#   })
#
# power = Motivation.create({
#   body: 'power'
#   })
#
# greater_good = Motivation.create({
#   body: 'the greater good'
#   })

# following_orders = Motivation.create({
#   body: 'following orders'
#   })
#
# revenge = Motivation.create({
#   body: 'revenge'
#   })

# USERS AND PROFILES
# potato = User.create({
#   email: 'potato@potato.potato',
#   password: 'potato'
#   })
#
# potatoprofile = Profile.create({
#   user_id: potato.id,
#   username: "potato",
#   summary: "I am a potato. I like to be a potato. Potato potato potato.",
#   birthday: Date.today - 18.years,
#   motivation: power
#
#   })
#
# tomato = User.create({
#   email: 'tomato@tomato.tomato',
#   password: 'tomato'
#   })
#
# tomatoprofile = Profile.create({
#   user_id: tomato.id,
#   username: "tomato",
#   summary: "I am a tomato. I like to be a tomato. Tomato tomato tomato.",
#   birthday: Date.today - 48.years,
#   motivation: greater_good
#
#   })
#
# 5.times do |index|
#   temp = User.create({
#     email: index, #Faker::Internet.email,
#     password: 'password'
#     })
#
#   Profile.create ({
#     user_id: temp.id,
#     username: Faker::Internet.domain_word + "_" + SecureRandom.urlsafe_base64(2),
#     summary: Faker::Lorem.paragraph,
#     birthday: Faker::Date.between(18.years.ago, 99.years.ago)
#     })
# end
#
# QUESTIONS
questions = [
  ["When fighting a hero, I'm usually","in the fray","back at my HQ, pulling strings from afar","monologuing","I have underlings for that"],
  ["Do you long for humanity's inevitable doom?","Yes","No"],
  ["Which Ninja Turtle do you think Shredder should have  dealt with first?","Leonardo","Donatello","Michaelangelo","Raphael"],
  ["Who would win, a robot shark or a cyborg octopus?","The cyborg octopus. Tentacles forever","The shark. Roboteeth rock"],
  ["The best way to celebrate your victory over humanity?","Watching the aftermatch from upclose where you can really enjoy it","Toasting champange in your tricked out jet far away from the nuclear blast and fallout","Boggle","Kicking back with my paid muscle, people afraid of me and assorted sociopaths."],
  ["How important is a good cackle when you state your plans?","Not very","Could go either way","It's the whole thing."],
  ["I have a fiendish and elaborate plan for taking over the world.","Obviously.","No, that's someone else's job. I just take orders.","Who needs plans? Just blow stuff up."],
  ["The Borg is","awesome","boring","what?"],
  ["Do you have a victory dance?","I like to move it move it.","No."],
  ["Do you enjoy poisoning the water supply?","I have 100 gallons of an undetectable toxin.","If I can't think of anything better to do.","I prefer a subtler approach.","I prefer a less subtle approach."],
  ["How many nuclear weapons do you have?","0","1","2 to 4","5 or more"],
  ["From the time you start formulating your plan, how long is it before you start to kill people?","Immediately.","Within a year.","More than a year.","I haven't kiled anyone yet."],
  ["Where is your ideal lair?","Volcano.","Deep under the sea.","Space station.","Urban penthouse."],
  ["Would you rather be feared or hated?","Feared.","Hated.","Who cares, as long as I make people uncomfortable."],
  ["Do you enjoy the suffering of your victims?","Yes, it gives me great pleasure.","No, I don't really notice it.","I haven't had any victims yet."],
  ["Cape or no cape?","Cape. Gotta look good.","No cape, that's for heroes.","My boss should tell me what to wear."],
  ["Which is your favorite Horseman of the Apocalypse?","Conquest","War","Famine","Death"],
  ["If you were a Game of Thrones character, which House would you belong to?","Lannister","Frey","Bolton","Targaryen"],
  ["Which of these is most important to your eventual plans for world domination?","Money.  Can't get anything rolling without a bit of money","Hired Muscle.  You know you could do it yourself, but hvaing other people do it on your command is so much better","Super Powers.  After all,  that's what makes you a SUPER villain, right?","A nemesis.  You can't truly enjoy world domination without someone making you work for it.  And then torturing them afterward makes it all worth it."],
  ["What's your favorite race from Doctor Who?","Daleks-  EXTERMINATE EXTERMINATE EXTERMINATE","Cybermen- Who needs Lowes when you can cannibalize your enemies for spare parts","Weeping Angels- Super fast, super scary, super weird abilities, with  only a slight downside","The Silence, because if your enemies don't know you exist, it's very easy to deal with them."],
  ["When you're Overlord of the world, how will you rule?","Harshly with an iron fist.  No insubordination can be tolerated","Meh, all I want is power, the little people can do whatever they please","I will first be the beloved savior of the commons.  And then I will be the almighty destroyer of the commons.","Rule what?  I'm just trying to blow things up"],
  ["At what age did you first aspire to dominate the world?","0-10","11-20","20-30","30+"]
]

questions.each do |question|
  question_body = question.delete_at(0)
  unless Question.find_by(question_body: question_body)
    q = Question.new({question_body: question_body})
    question.each do |answer|
      q.answers.new({answer_text: answer})
    end
    q.save
  end
end
