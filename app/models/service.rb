class Service < ActiveRecord::Base
  belongs_to :category
  belongs_to :page
  has_many :form_builds
  has_and_belongs_to_many :bundles
  has_many :deliveries
  accepts_nested_attributes_for :deliveries, allow_destroy: true
  
	before_save :capitalize_name
  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  has_attached_file :imghover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imghover, content_type: /\Aimage\/.*\Z/
  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "0.png"
  #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	protected
	def capitalize_name
      self.name = self.name.capitalize
    end
end
