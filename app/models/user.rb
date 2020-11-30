class User < ApplicationRecord
  has_secure_password

  has_many :task_groups
  has_many :grouped_tasks, through: :task_groups, source: :tasks
  has_many :ungrouped_tasks, as: :taskable, class_name: 'Task'

  has_many :note_groups
  has_many :grouped_notes, through: :note_groups, source: :notes
  has_many :ungrouped_notes, as: :noteable, class_name: 'Note'
  
  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is valid' } 

  def all_tasks
    Task.union(self.grouped_tasks, self.ungrouped_tasks).order(created_at: :desc)
  end

  def all_notes
    Note.union(self.grouped_notes, self.ungrouped_notes).order(created_at: :desc)
  end
end
