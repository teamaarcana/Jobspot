class Category < ApplicationRecord
  has_many :seeker_categories
  validates_presence_of :name
end
