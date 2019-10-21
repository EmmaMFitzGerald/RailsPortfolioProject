class Child < ApplicationRecord
    validates :name, presence: :true, length: {minimum: 2, maximum: 15}
    validates :birthday, presence: :true
    has_many :memories
    accepts_nested_attributes_for :memories, allow_destroy: true
    has_many :categories, through: :memories
    belongs_to :user
    validates :user_id, presence: :true

    scope :search, -> (parameter) {where("lower(name) LIKE :search", search: "%#{parameter}%")   }

    def age(birthday)
        now = Time.now.utc.to_date
        now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
    end
end  