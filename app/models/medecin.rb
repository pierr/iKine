# == Schema Information
# Schema version: 20110521192843
#
# Table name: medecins
#
#  id         :integer         not null, primary key
#  nom        :string(255)
#  prenom     :string(255)
#  email      :string(255)
#  telephone  :string(255)
#  adresse_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Medecin < ActiveRecord::Base
  
  belongs_to :adresse
  belongs_to :civilite
  
  has_many :patients
  has_many :ordonnances
  
end
