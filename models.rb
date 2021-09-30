ActiveRecord::Base.establish_connection

class User < ActiveRecord::Base
    has_many :user_courses
    has_many :courses, through: :user_courses
end

class Course < ActiveRecord::Base
    has_many :user_courses
    has_many :users, through: :user_courses
end

class UserCourse < ActiveRecord::Base
    belongs_to :user
    belongs_to :course
end