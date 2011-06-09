# == Schema Information
# Schema version: 20110608103621
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
#  created_at    :datetime
#  updated_at    :datetime
#

class Seance < ActiveRecord::Base
  belongs_to :ordonnance, :validate => true
  # Le patient est dans l'odonnance belongs_to :patient, :validate => true
  belongs_to :user, :validate => true
  belongs_to :ordonnance, :validate => true
  belongs_to :patient, :validate => true
  validates_presence_of :user_id, :patient_id, :ordonnance_id
end
