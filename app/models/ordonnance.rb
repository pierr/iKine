# == Schema Information
# Schema version: 20110521192843
#
# Table name: ordonnances
#
#  id                   :integer         not null, primary key
#  numero               :string(255)
#  pathologie           :string(255)
#  date                 :datetime
#  prise_en_charge      :string(255)
#  type_prise_en_charge :string(255)
#  paye                 :boolean
#  nombre_seances       :integer
#  bilan                :string(255)
#  caisse               :string(255)
#  mutuelle             :string(255)
#  patient_id           :integer
#  medecin_id           :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class Ordonnance < ActiveRecord::Base
  attr_accessible :numero,
                  :pathologie,
                  :date,
                  :prise_en_charge,
                  :type_prise_en_charge,
                  :paye,
                  :nombre_seances,
                  #:bilan,
                  :caisse,
                  :mutuelle,
                  :user_tokens,
                  :patient_token,
                  :medecin_token,
                  :medecin,
                  :patient,
                  :bilan_attributes
  attr_reader :user_tokens,
              :patient_token, 
              :medecin_token
  belongs_to :patient, :validate => true
  belongs_to :medecin , :validate => true
  has_many :seances
  has_one :bilan , :autosave => true
  accepts_nested_attributes_for :bilan, :allow_destroy => true
  has_many :user_ordonnances
  has_many :users, :through => :user_ordonnances , :validate => false#Si on ne met pas ça ca ne fonctionne pas car il cherche à valider les users avec les password
  #default_scope :order => 'ordonnances.created_at DESC' #pour avoir automatiquement un tri par défaut
  
  ordonnance_regex = /\A[\w+\-.]\z/i  #Une regexp pour les numeros d'ordonnances
    
  validates :numero, # :format     => { :with => ordonnance_regex },
            :presence   =>true,
            :uniqueness =>true
  
  validates_presence_of  :date, :nombre_seances#FIXME PIERRE JE NE COMPRENDS PAS POURQUOI ca ne fonctionne pas avec a, :patient_id, :medecin_id
  
  validates_associated :seances #s'assurer que les objets liés existent bien
  
 def as_json(options)
 { 
       :id => id,
       :name => name
 }
 end
 
 
 #Methode qui permet de rechercher des ordonnances
  def self.search(search)
    if search
      where('numero LIKE ?', "%#{search}%")
    else
      scoped #Comme all mais ne fait pas la requete
    end
  end
  def med
    if medecin.nil?
      return "pas de medecin"
    else
      return "Dr #{medecin.prenom} #{medecin.nom}"
    end
  end
  def pat
    if patient.nil?
      return "pas de patient"
    else
      return "#{patient.prenom} #{patient.nom}"
    end
  end
  
  
  def user_tokens=(ids)
    self.user_ids = ids.split(",")
    puts "USER IDS"
    puts user_ids
    puts self.valid?
    puts self.errors
    for user in self.users
      puts user.id
      puts user.valid?
      puts user.errors
    end
  end
  def patient_token=(id)
    self.patient_id = id
  end
  def medecin_token=(id)
    self.medecin_id = id
  end
  
  private
  def name
      "Ordonnance #{numero} du #{date.strftime("%d/%m/%Y")}"
  end
  
end
