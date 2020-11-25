# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    
    has_many :enrollments, # connects us to Enrollment on line 13
        class_name: :Enrollment,
        foreign_key: :student_id,
        primary_key: :id
        # this is a bridge for enrolled students effectively

    has_many :enrolled_courses,
        through: :enrollments, # refers to method on line 12. Use connection on line 12
        source: :course # association on the Enrollment class
    
    has_many :taught_courses,
        class_name: :Course, 
        foreign_key: :instructor_id,
        primary_key: :id

end
