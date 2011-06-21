# == Schema Information
# Schema version: 20110616110935
#
# Table name: seances
#
#  id            :integer         not null, primary key
#  date_debut    :datetime
#  duree         :integer
#  commentaire   :string(255)
#  paye          :boolean
#  a_domicile    :boolean
#  ordonnance_id :integer
#  user_id       :integer
#  patient_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Seance < ActiveRecord::Base
  attr_accessible :numero,
                  :date_debut,
                  :duree,
                  :commentaire,
                  :paye,
                  :a_domicile,
                  :patient_token,
                  :user_token,
                  :patient,
                  :ordonnance,
                  :user,
                  :ordonnance_id,
                  :ordonnance_attributes,
                  :ordonnance_token
  attr_reader :patient_token,
              :user_token,
              :ordonnance_token
  belongs_to :ordonnance, :validate => true
  # Le patient est dans l'odonnance belongs_to :patient, :validate => true
  belongs_to :user
  belongs_to :ordonnance, :validate => true
  belongs_to :patient, :validate => true
  validates_presence_of :user_id, :patient_id, :ordonnance_id
  validates_presence_of :user_token, :patient_token, :ordonnance_token, :duree
  accepts_nested_attributes_for :ordonnance
  
  def patient_token=(id)
    self.patient_id = id
  end
  
  def user_token=(id)
    self.user_id = id
  end
  
    def ordonnance_token=(id)
    self.ordonnance_id = id
  end
end


