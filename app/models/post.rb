class Post < ActiveRecord::Base
  attr_accessible :content, :preview, :title

  validates :title, :content, presence: true


end
