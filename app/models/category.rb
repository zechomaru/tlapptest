class Category < ActiveRecord::Base
	has_many :services
	before_save :capitalize_name

	protected
	def capitalize_name
      self.name = self.name.capitalize
    end
end
