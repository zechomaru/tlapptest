class Form < ActiveRecord::Base
  belongs_to :form_build
  belongs_to :status_order
  has_many :answers, class_name: 'FormAnswer'
	accepts_nested_attributes_for :answers, allow_destroy: true

	before_save :status

	protected
	def status
			status_name = StatusOrder.find_by_name('Pendiente')
      self.status_order_id = status_name.id
    end
end
