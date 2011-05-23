# == Schema Information
# Schema version: 20110521192843
#
# Table name: villes
#
#  id             :integer         not null, primary key
#  nom            :string(255)
#  code_postal    :string(255)
#  departement_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Ville < ActiveRecord::Base
  
  belongs_to :departement
  
  has_many :adresses
  
end
