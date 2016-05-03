class Page < ActiveRecord::Base
  belongs_to :service
  belongs_to :bundle
end
