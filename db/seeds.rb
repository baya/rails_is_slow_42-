# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

date_range = Date.parse('1960/1/1')..(10000.days.since(Date.parse('1960/1/1')))
[*1..10000].each do |i|
  User.create! name: "User %05d" % i,
  account: "user_%05d" % i,
  email: "user%05d@example.com" % i,
  phone: "%011d" % i,
  zip: "%03d" % (i / 10),
  address: "#{i}-#{i} Tokyo, Japan" % i,
  birthday: rand(date_range),
  age: i / 365,
  company: "#{i}Signals",
  bio: 'Lorem ipsum dolor sit amet, consectetur adipisicing
elit, sed do eiusmod tempor incididunt ut labore et dolore
magna aliqua. Ut enim ad minim veniam, quis nostrud exerci
tation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in
voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proiden
t, sunt in culpa qui officia deserunt mollit anim id est
laborum.',
  admin: true
end
