class Category < ApplicationRecord
    before_save :tileize_name
    validates :name, uniqueness: true
    has_many :memories
    
    def tileize_name
      self.name = self.name.titleize
    end
end