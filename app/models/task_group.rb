class TaskGroup < ApplicationRecord
  belongs_to :user
  has_many :tasks, as: :taskable

  validates :name, presence: true, length: { maximum: 20 }
end
