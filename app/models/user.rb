# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  comments_count         :integer
#  email                  :string
#  likes_count            :integer
#  password_digest_string :string
#  private                :boolean
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  has_many(:photos, { :class_name => "Photo", :foreign_key => "owner_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "author_id", :dependent => :destroy })
  has_many(:followrequests, { :class_name => "Followrequest", :foreign_key => "recipient_id", :dependent => :destroy })
  has_many(:followrequest, { :class_name => "Followrequest", :foreign_key => "sender_id", :dependent => :destroy })

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
