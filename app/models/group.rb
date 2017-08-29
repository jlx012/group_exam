class Group < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins, source: :user

  validates :name, presence: true, length: 2..50
  validates :description, presence: true, length: 10..200
end
