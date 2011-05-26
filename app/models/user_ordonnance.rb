class UserOrdonnance < ActiveRecord::Base
  attr_accessible :user_id, :ordonnance_id
  belongs_to :ordonnance
  belongs_to :user
end