class FRole < ActiveRecord::Base
	has_many :freelances
	before_save :capitalize_name

	protected
	def capitalize_name
      self.name = self.name.capitalize
    end
end
