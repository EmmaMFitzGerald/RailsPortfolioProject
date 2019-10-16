class Memory < ApplicationRecord
    validates :title, presence: :true, length: {minimum: 2, maximum: 140 }
    validates :content, presence: :true, length: {maximum: 500} 
  
    belongs_to :child
    belongs_to :user
    belongs_to :category
  
    accepts_nested_attributes_for :category
  
    def category_attributes=(category)
        self.category = Category.find_or_create_by(name: category[:name])
        self.category.update(category)
    end
  
end