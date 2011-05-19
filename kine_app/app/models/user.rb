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

require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  #C'est pour pouvoir accéder aux variables.(accesseurs)
  attr_accessible :surname,
                  :firstname, 
                  :email, 
                  :phone,
                  :password,
                  :password_confirmation
 
  #Experssion régulière pour les mails
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #Ici on s'occupe de la validation des formulaires.
  validates :surname, :presence =>true,
                      :length   => { :maximum => 50 }
                      
  validates :firstname, :presence =>true,
                        :length   => { :maximum => 50 }
                        
  validates :email, :format     => { :with => email_regex },
                    :presence   =>true,
                    :uniqueness =>true
  # Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
 #Cette méthode sera appellée avant chaque sauvegarde.
   before_save :encrypt_password

   def has_password?(submitted_password)
     encrypted_password == encrypt(submitted_password)
   end

   private

     def encrypt_password
       self.salt = make_salt if new_record?
       self.encrypted_password = encrypt(password)
     end

     def encrypt(string)
       secure_hash("#{salt}--#{string}")
     end

     def make_salt
       secure_hash("#{Time.now.utc}--#{password}")
     end

     def secure_hash(string)
       Digest::SHA2.hexdigest(string)
     end
 end
 