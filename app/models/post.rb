class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 20}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :valid_title

  def valid_title
    if self.title != "You Won't Believe These True Facts"
      errors.add(:title, :invalid)
    end
  end
end
