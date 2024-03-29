#encoding: utf-8
class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price

  default_scope :order => 'title'
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, :presence => true

  validates :title, :uniqueness => true

  validates_length_of :title, :minimum => 10, :too_short => 'deve conter pelo menos 10 caracteres.'

  validates :image_url, :format => {
  	:with    => %r{\.(gif|jpg|png)$}i,
  	:message => 'deve ser uma URL para uma imagem GIF, JPG ou PNG.'
  }

  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end
