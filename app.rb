require 'bundler/setup'
Bundler.require
require './models.rb'

ActiveRecord::Base.logger = nil

Course.all.each { |c| c.destroy }
User.all.each { |c| c.destroy }
UserCourse.all.each { |c| c.destroy }

android = Course.create(name: "Android")
iphone = Course.create(name: "iPhone")
unity = Course.create(name: "Unity")
webd = Course.create(name: "WebD")
webs = Course.create(name: "WebS")

mizu = User.create(name: 'mizu')

mizu.courses << android
mizu.courses << webs
mizu.courses << webd

# p mizu.courses

######

tommy = User.create(name: 'tommy')

tommy.courses << android
tommy.courses << iphone
tommy.courses << webs

# p tommy.courses

users = User.joins(:user_courses).merge(UserCourse.where(course_id: android.id)).merge(UserCourse.where(course_id: iphone.id))

users.each do |user|
  puts user.name
end

