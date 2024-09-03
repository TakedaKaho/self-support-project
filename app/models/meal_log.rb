class MealLog < ApplicationRecord
  belongs_to :user
  
  enum meal_type: { 朝食: 0, 昼食: 1, 夕食: 2, 間食: 3 }
end
