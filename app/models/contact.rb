class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :number, presence: true
  has_and_belongs_to_many :messages
  belongs_to :user
end
