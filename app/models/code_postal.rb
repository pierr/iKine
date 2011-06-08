# == Schema Information
# Schema version: 20110608103621
#
# Table name: code_postals
#
#  id            :integer         not null, primary key
#  numero        :string(255)
#  code_insee_id :integer
#

class CodePostal < ActiveRecord::Base
  validates :numero, :presence =>true,
                      :length   => { :maximum => 5}
  belongs_to :code_insee , :validate => true
  validates_presence_of :code_insee_id
  code_insee_regex =/^((0[1-9])|([1-8][0-9])|(9[0-8])|(2A)|(2B))[0-9]{3}$/
  validate :numero , :format => {:with => code_insee_regex}
end
