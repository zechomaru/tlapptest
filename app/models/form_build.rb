class FormBuild < ActiveRecord::Base
	belongs_to :service
	has_many :questions, class_name: 'FormQuestion'
	accepts_nested_attributes_for :questions, allow_destroy: true
end