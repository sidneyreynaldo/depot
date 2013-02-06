class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price

  validates :title, :description, :image_url, :presence => true

  validates :title, :uniqueness => true

  validates :image_url, :format => {
  	:with    => %r{\.(gif|jpg|png)$}i,
  	:message => 'deve ser uma URL para uma imagem GIF, JPG ou PNG.'
  }

  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

end
