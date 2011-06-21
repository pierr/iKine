# == Schema Information
# Schema version: 20110519172557
#
# Table name: adresses
#
#  id                 :integer         not null, primary key
#  numero             :string(255)
#  rue                :string(255)
#  complement_adresse :string(255)
#  code_insee_id       :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Adresse < ActiveRecord::Base
  belongs_to :code_insee
  has_many :patients # si si, ptet que des gens habitent dans la même maison...
  has_many :medecins
  has_many :rdvs
end
