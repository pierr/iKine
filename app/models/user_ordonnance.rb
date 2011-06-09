# == Schema Information
# Schema version: 20110608095011
#
# Table name: user_ordonnances
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  ordonnance_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class UserOrdonnance < ActiveRecord::Base
  attr_accessible :user_id, :ordonnance_id
  belongs_to :ordonnance
  belongs_to :user
end
