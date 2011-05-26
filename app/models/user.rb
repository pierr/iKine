# == Schema Information
# Schema version: 20110521192843
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  nom                :string(255)
#  prenom             :string(255)
#  email              :string(255)
#  telephone          :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  admin              :boolean
#

require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  #C'est pour pouvoir accéder aux variables.(accesseurs)
  attr_accessible :nom,
                  :prenom,
                  :telephone, 
                  :email, 
                  :phone,
                  :password,
                  :password_confirmation
  has_many :user_ordonnances
  has_many :ordonnances ,:through => :user_ordonnances
  
  #Experssion régulière pour les mails
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #Ici on s'occupe de la validation des formulaires.
  validates :nom, :presence =>true,
                      :length   => { :maximum => 50 }
                      
  validates :prenom, :presence =>true,
                        :length   => { :maximum => 50 }
                    
                    #:format     => { :with => email_regex },
  validates :email, :email_format => true,
                    :presence   =>true,
                    :uniqueness =>true
  # Crée automatiquement l'attribut 'password_confirmation'.
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
 #Cette méthode sera appellée avant chaque sauvegarde.
   before_save :encrypt_password

   def has_password?(submitted_password)
     encrypted_password == encrypt(submitted_password)
   end
   
   # Peremt d'autentifier un utilisateur
     # Params:
     # - email: email de l'utilisateur
     # - submitted_password: le mot de passe que l'on veut tester
     # Return: l'utilisateur si ça correspond (pass et email) , nil sinon
   def self.authenticate(email, submitted_password)
     user = find_by_email(email)
     return nil  if user.nil?
     return user if user.has_password?(submitted_password)
    end
    
    def self.authenticate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        (user && user.salt == cookie_salt) ? user : nil
    end
    
    #Implémenter une methode search pour chaque objet qui permet de tout fouilles.
    def self.search(query)
      if !query.to_s.strip.empty?
            tokens = query.split.collect {|c| "%#{c.downcase}%"}
      end
    end
   private

     def encrypt_password
       self.salt = make_salt if new_record?
       self.encrypted_password = encrypt(password)
     end

     def encrypt(string)
       secure_hash("#{salt}--#{string}")
     end
     #Permet d'ajouter le timestamp au mot de passe dans la génération du mot de passe crypté comme ça deux users avec le meme mot de passe n'auront pas de problèmes
     def make_salt
       secure_hash("#{Time.now.utc}--#{password}")
     end

     def secure_hash(string)
       Digest::SHA2.hexdigest(string)
     end
 end
 
