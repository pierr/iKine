# == Schema Information
# Schema version: 20110521192843
#
# Table name: adresses
#
#  id         :integer         not null, primary key
#  nom        :string(255)
#  ville_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Adresse < ActiveRecord::Base
  
  belongs_to :ville
  
  has_many :patients # si si, ptet que des gens habitent dans la même maison...
  has_many :medecins
  has_many :rdvs
  
end
