# == Schema Information
# Schema version: 20110608095011
#
# Table name: adresses
#
#  id                 :integer         not null, primary key
#  numero             :string(255)
#  rue                :string(255)
#  complement_adresse :string(255)
#  code_postal_id     :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Adresse < ActiveRecord::Base
  
  #belongs_to :ville
  has_one :code_postal
  has_many :patients # si si, ptet que des gens habitent dans la même maison...
  has_many :medecins
  has_many :rdvs
  
end
