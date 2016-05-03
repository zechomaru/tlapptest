class AddAttachmentAvatarToFreelances < ActiveRecord::Migration
  def self.up
    change_table :freelances do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :freelances, :avatar
  end
end
