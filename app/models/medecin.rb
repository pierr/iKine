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
  #validates_presence :adresse_id, :civilite_id
  has_many :patients
  has_many :ordonnances
  #@override une methode par défaut mais cette methode permet de définir le fichier.json
  #pour un user qui sera appellé pour l'auto completion
  # options => sont les options qu'on peut vouloir donner 
  def as_json(options)
   { 
     :id => id,
     :name => name
   }
  end
  private 
  def name
  "#{prenom} #{nom}"
  end
end
