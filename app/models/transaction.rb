class Transaction < ApplicationRecord
  validates :Thash ,uniqueness:true, presence:true
  validates :data , presence:true
end
