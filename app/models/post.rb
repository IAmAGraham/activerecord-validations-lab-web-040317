class Post < ActiveRecord::Base
validates :title, presence: true
validates :content, length: {:minimum => 250}
validates :summary, length: {:maximum => 250}
validates :category, inclusion: {:in => %w(Fiction Non-Fiction)}

validate :click_bait

WORDS = [
  /Won't Believe/,
  /Secret/,
  /Guess/
]

  def click_bait
    if WORDS.none? { |blah| blah.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
