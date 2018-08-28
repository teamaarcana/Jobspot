class RecuitorProfile < ApplicationRecord
  belongs_to :recuitor
  validates_presence_of :company_name,:contact_no,:address,:pan_no
end
