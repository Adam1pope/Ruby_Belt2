class Song < ActiveRecord::Base
	has_many :favorites, dependent: :destroy
	has_many :users, through: :favorites 

	validates :title, :artist, length: { minimum: 2 }, presence: true 
end
