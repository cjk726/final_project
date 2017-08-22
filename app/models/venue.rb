# == Schema Information
#
# Table name: venues
#
#  id              :integer          not null, primary key
#  venue_name      :string
#  address         :string
#  neighborhood_id :integer
#  ambience        :string
#  pool_table_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Venue < ApplicationRecord
    has_many :bookmarks, :dependent => :destroy
    has_many :pool_tables, :dependent => :destroy
    belongs_to :neighborhood
    has_many :users, :through => :bookmarks, :source => :user
    
    validates :venue_name, :presence => true, :uniqueness => {:scope => :address}
    validates :address, :presence => true
    validates :neighborhood_id, :presence => true

end