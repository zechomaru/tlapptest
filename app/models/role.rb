class Role < ActiveRecord::Base
	has_many :admins
	before_save :capitalize_name

	protected
	def capitalize_name
      self.name = self.name.capitalize
    end
end
