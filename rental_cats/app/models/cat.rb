# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    validates :birth_date, :name, :description, presence: true 
    validates :color, inclusion: { in: %w(black brown white orange ), message: "%{value} is not a valid color" }
    validates :sex, inclusion: { in: %w(F M), message: "%{value} is not a valid sex" }

    def age 
        current_year=Time.now.year
        current_year - self.birth_date.year 
    end
    
end
