# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :bookmarks, :dependent => :destroy
  # has_many :pool_tables, :through => :bookmarks, :source => :pool_table
  has_many :venues, :through => :bookmarks, :source => :venue
  # is the line below that introduces a new association name needed or is it repeating the has_many :pool_tables lines from above
  has_many :bookmarked_pool_tables, :through => :bookmarks, :source => :pool_table   # need to have one-to-manies done first (as above and in other models)

  validates :username, :presence => true, :uniqueness => true

end
