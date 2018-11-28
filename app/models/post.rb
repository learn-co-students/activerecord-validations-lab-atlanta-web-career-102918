class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_click_bait

     def is_click_bait
        click_bait = [/Won't Believe/i, /Secret/i, /Top [\d*]/i, /Guess/i]
         if click_bait.none? { |words| words.match title}
            errors.add(:title, "the post title must be a clickbait")
        end
    end
end
