class AddAttachmentImghoverToBundles < ActiveRecord::Migration
  def self.up
    change_table :bundles do |t|
      t.attachment :imghover
    end
  end

  def self.down
    remove_attachment :bundles, :imghover
  end
end
