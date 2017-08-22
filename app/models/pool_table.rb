# == Schema Information
#
# Table name: pool_tables
#
#  id              :integer          not null, primary key
#  pool_table_name :string
#  price           :float
#  size            :integer
#  pool_table_pic  :string
#  venue_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PoolTable < ApplicationRecord
    belongs_to :venue
    has_many :bookmarks, :dependent => :destroy
    has_many :users, :through => :bookmarks, :source => :user
    has_one :neighborhood, :through => :venue, :source => :neighborhood
    
    validates :pool_table_name, :presence => true, :uniqueness => {:scope => :venue_id}
    validates :venue_id, :presence => true
end