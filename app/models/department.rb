class Department < ActiveRecord::Base
  has_many :subjects
  has_many :departmentusers
  has_many :students
  has_many :teachers
  has_many :labs
  has_one :timenotifi
end
