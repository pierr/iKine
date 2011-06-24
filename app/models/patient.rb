# == Schema Information
# Schema version: 20110616110935
#
# Table name: patients
#
#  id              :integer         not null, primary key
#  nom             :string(255)
#  prenom          :string(255)
#  email           :string(255)
#  telephone       :string(255)
#  date_naissance  :datetime
#  pathologie      :string(255)
#  numero_secu     :integer
#  civilite_id     :integer
#  adresse_id      :integer
#  medecin_id      :integer
#  carte_vitale_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Patient < ActiveRecord::Base
  attr_writer :name
  belongs_to :civilite
  belongs_to :adresse
  belongs_to :medecin
  belongs_to :carte_vitale
  
  has_many :ordonnances , :dependent => :destroy #empeche la destruction du patient si il y a encore une ordonnance qui lui est ié
  has_many :rdvs
  
  
#  attr_accessible :patient_token, :prenom, :nom, :email, :telephone, :date_naissance, :pathologie, :numero_secu
#  attr_reader :patient_token
  validates :nom, :presence =>true
   #@override une methode par défaut mais cette methode permet de définir le fichier.json
    #pour un user qui sera appellé pour l'auto completion
    # options => sont les options qu'on peut vouloir donner 
    def as_json(options= {})
     { 
       :id => id,
       :name => name
     }
    end
    def name
      "#{prenom} #{nom}"
    end
  def patient_token=(id)
    self.id = id
  end
  
  
   #Methode qui permet de rechercher des ordonnances
  def self.search(search)
    if search
      where('nom LIKE ? or prenom LIKE ?', "%#{search}%","%#{search}%")
    else
      scoped #Comme all mais ne fait pas la requete
    end
  end
  
  
end
