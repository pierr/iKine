# == Schema Information
# Schema version: 20110608103621
#
# Table name: departements
#
#  id     :integer         not null, primary key
#  numero :string(255)
#  nom    :string(255)
#

class Departement < ActiveRecord::Base
  has_many :code_insee , :validate => true
end
