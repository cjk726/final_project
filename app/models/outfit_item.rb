# == Schema Information
#
# Table name: outfit_items
#
#  id               :integer          not null, primary key
#  outfit_id        :integer
#  clothing_item_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class OutfitItem < ApplicationRecord
    belongs_to :outfit
    belongs_to :clothing_item
    
    validates :clothing_item_id, :presence => true
    validates :outfit_id, :presence => true, :uniqueness => {:scope => :clothing_item_id}
end
