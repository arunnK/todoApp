class Todolist < ActiveRecord::Base

	scope :done, -> { where(done: true) }
	scope :pending, -> { where(done: false) }

	before_validation :init

	def init
		self.done = false
		true
	end
end
