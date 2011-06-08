# == Schema Information
# Schema version: 20110608103621
#
# Table name: code_insees
#
#  id             :integer         not null, primary key
#  numero         :string(255)
#  ville_id       :integer
#  departement_id :integer
#

class CodeInsee < ActiveRecord::Base
  has_many :code_postals
  has_one :departement ,:validate => true
  has_one :ville, :validate => true
  validates_presence_of :ville_id, :departement_id  
  code_insee_regex =/^((0[1-9])|([1-8][0-9])|(9[0-8])|(2A)|(2B))[0-9]{3}$/
  validate :numero , :presence => true ,
                     :format  => { :with => code_insee_regex }
  validates_associated :code_postals
end
