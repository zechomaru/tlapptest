class Bundle < ActiveRecord::Base
	has_and_belongs_to_many :services
  belongs_to :page
  before_save :capitalize_name
	 has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  has_attached_file :imghover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imghover, content_type: /\Aimage\/.*\Z/

	protected
	def capitalize_name
      self.name = self.name.capitalize
    end
end
