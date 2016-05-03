class AddAttachmentImgToBundles < ActiveRecord::Migration
  def self.up
    change_table :bundles do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :bundles, :img
  end
end
