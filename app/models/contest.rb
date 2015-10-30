class Contest < ActiveRecord::Base
  validates :username, uniqueness: { case_sensitive: false }
end
