class NoteGroup < ApplicationRecord
  belongs_to :user
  has_many :notes, as: :noteable
end
