# == Schema Information
#
# Table name: clothing_items
#
#  id         :integer          not null, primary key
#  item_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ClothingItem < ApplicationRecord
    has_many :outfit_items, :dependent => :destroy
    has_many :outfits, through: :outfit_items
    validates :item_name, :presence => true, uniqueness: { case_sensitive: false }
end
