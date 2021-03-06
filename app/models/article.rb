class Article < ActiveRecord::Base

	belongs_to :usuer
	has_many :comments
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: { minimum: 20 }
	before_create :set_visits_count


	def update_visits_count
		self.update(visits_counts: self.visits_counts + 1)
	end


	private

	def set_visits_count
		self.visits_counts = 0;
	end
end
