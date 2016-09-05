# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
u1 = User.create!(username: 'Buddy')
u2 = User.create!(username: 'Guy')
u3 = User.create!(username: 'Pal')

Contact.destroy_all
c1 = Contact.create!(name: 'Friend', email: "friend@friend.com", user_id: u1.id)
c2 = Contact.create!(name: 'Dude', email: "dude@dude.com", user_id: u2.id)
c3 = Contact.create!(name: 'Someone', email: "someone@someone.com", user_id: u3.id)

ContactShare.destroy_all
cs1 = ContactShare.create!(user_id: u1.id, contact_id: c2.id)
cs2 = ContactShare.create!(user_id: u2.id, contact_id: c3.id)
cs3 = ContactShare.create!(user_id: u1.id, contact_id: c3.id)
