# == Schema Information
# Schema version: 20110521192843
#
# Table name: civilites
#
#  id         :integer         not null, primary key
#  nom        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Civilite < ActiveRecord::Base
  
  has_many :patients
  has_many :medecins
  
end
