# == Schema Information
#
# Table name: outfits
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  comfort_zone_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Outfit < ApplicationRecord
    belongs_to :user
    has_many :outfit_items, :dependent => :destroy
    has_many :clothing_items, through: :outfit_items        # is a :source => :whatever   needed?
    belongs_to :comfort_zone
    
    validates :user_id, :presence => true
    validates :comfort_zone_id, :presence => true, :uniqueness => {:scope => :user_id}
    
end
