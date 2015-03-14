class AddAttachmentImageToVins < ActiveRecord::Migration
  def self.up
    change_table :vins do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :vins, :image
  end
end
