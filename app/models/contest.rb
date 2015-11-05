class Contest < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
end
