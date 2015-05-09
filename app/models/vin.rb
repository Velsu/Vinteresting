class Vin < ActiveRecord::Base
	acts_as_votable
	belongs_to :user

	has_attached_file :image, 
	:styles => { :medium => "300x300>", :thumb => "100x100>" }
	
	validates :image, presence: true
	validates :description, presence: true

end
