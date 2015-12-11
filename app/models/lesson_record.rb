class LessonRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :classroom

  validates :lesson, presence: true
  validates :user, presence: true
  validates :classroom, presence: true
  validates :views, presence: true
  validates :covered, inclusion: { in: [true, false] }

  def add_view
    update_attributes(
      views: views + 1,
      covered: lesson.all_tasks_covered_by?(user)
    )
  end
end