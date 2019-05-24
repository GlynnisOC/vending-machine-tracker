class Machine < ApplicationRecord
  has_many :snacks
  validates_presence_of :location
  belongs_to :owner

end
