# == Schema Information
# Schema version: 20110608103621
#
# Table name: villes
#
#  id  :integer         not null, primary key
#  nom :string(255)
#

class Ville < ActiveRecord::Base
  has_many :code_insees
  has_many :code_postals, :through => :code_insees 
end
