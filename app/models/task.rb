class Task < ApplicationRecord
  belongs_to :taskable, polymorphic: true, optional: true

  belongs_to :parent_task, class_name: 'Task', optional: true
  has_many :sub_tasks, class_name: 'Task', foreign_key: 'parent_task_id'
end
