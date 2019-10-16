class Category < ApplicationRecord
    before_save :tileize_name
    validates :name, uniqueness: true
    has_many :memories
    has_many :children, through: :memories
    
    def tileize_name
      self.name = self.name.titleize
    end
end