class AddAttachmentImgToServices < ActiveRecord::Migration
  def self.up
    change_table :services do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :services, :img
  end
end
