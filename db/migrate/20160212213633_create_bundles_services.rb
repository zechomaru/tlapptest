class CreateBundlesServices < ActiveRecord::Migration
  def change
    create_table :bundles_services, id: false do |t|
    	t.belongs_to :bundle, index: true
    	t.belongs_to :service, index: true
    end
  end
end
