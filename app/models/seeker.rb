class Seeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :seeker_profile
  has_many :seeker_educations
  has_many :education, :through => :seeker_educations
  accepts_nested_attributes_for :seeker_educations

end
