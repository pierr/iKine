# == Schema Information
# Schema version: 20110518115000
#
# Table name: users
#
#  id         :integer         not null, primary key
#  surname    :string(255)
#  firstname  :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  #C'est pour pouvoir accéder aux variables.(accesseurs)
  attr_accessible :surname,
                  :firstname, 
                  :email, 
                  :phone
 
  #Experssion régulière pour les mails
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #Ici on s'occupe de la validation des formulaires.
  validates :surname, :presence=>true,
                      :length   => { :maximum => 50 }
                      
  validates :firstname, :presence=>true,
                        :length   => { :maximum => 50 }
                        
  validates :email, :format   => { :with => email_regex },
                    :presence=>true,
                    :uniqueness =>true
end
