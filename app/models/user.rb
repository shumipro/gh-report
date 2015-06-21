class User < ActiveRecord::Base
  validates :uid,   presence: true
  validates :token, presence: true
end
