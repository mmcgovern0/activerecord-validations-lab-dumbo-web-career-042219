class Post < ActiveRecord::Base

	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	validate :not_nil


	def not_nil
		if title != nil
			self.clickbait
		else
			"Yo, add a title"
		end
	end

	def clickbait
		unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top [number]") || title.include?("Guess")
			errors.add(:title, "Na son you would have thought")
		end
	end
end

