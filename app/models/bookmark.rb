# == Schema Information
#
# Table name: bookmarks
#
#  id            :integer          not null, primary key
#  venue_id      :integer
#  pool_table_id :integer
#  user_id       :integer
#  comments      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Bookmark < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    belongs_to :pool_table
    has_one :neighborhood, :through => :venue, :source => :neighborhood
    
    validates :user_id, :presence => true, :uniqueness => {:scope => :pool_table_id}
    # validates :venue_id, :presence => true
    validates :pool_table_id, :presence => true
    
end