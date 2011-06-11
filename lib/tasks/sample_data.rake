require 'faker'
require 'SecureRandom'

namespace :db do
  desc "Remplit la base avec pleins de faux trucs en appelant les autres taches de ce fichier apres avoir vider la base"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Rake::Task['db:migrate'].invoke  
    Rake::Task['db:populate_ville'].invoke
    Rake::Task['db:populate_departement'].invoke
    Rake::Task['db:populate_code_insee_postal'].invoke
    Rake::Task['db:populate_adresse'].invoke
    Rake::Task['db:populate_users'].invoke
    Rake::Task['db:populate_medecin'].invoke
    Rake::Task['db:populate_patient'].invoke
    Rake::Task['db:populate_ordonnances'].invoke
    Rake::Task['db:populate_seances'].invoke    
  end
end
#Parametres 
n_user = 999
n_ville = 100
n_code_insee = 100
n_departement = 10
n_adresse = 1000
n_medecin = 100
n_ordonnance = 100
n_seance = 500
n_patient = 200

namespace :db do
  desc "Remplit la base avec de faux utilisateurs"
  task :populate_users => :environment do
    puts "Users => Praticiens"
    admin = User.create!(:nom => "Besson",
                 :prenom => "Pierre",
                 :email => "pierre.besson7@gmail.com",
                 :password => "kineapp",
                 :password_confirmation => "kineapp")
    admin.toggle!(:admin)
    admin2 =  User.create!(:nom => "Besson",
                 :prenom => "Collyne",
                 :email => "collyne.besson@gmail.com",
                 :password => "kineapp",
                 :password_confirmation => "kineapp")
    admin2.toggle!(:admin)            
    n_user.times do |n|
      
      nomprenom  = Faker::Name.name.split
      nom = nomprenom[0]
      prenom = nomprenom[1]
      email = Faker::Internet.email
      password  = "kineapp"
      u = User.create!(:nom => nom,
                   :prenom => prenom,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    puts u.errors unless u.errors.size <1
    end
  end
end

namespace :db do
  desc 'Cree une ordonnance'
  task :populate_ordonnances => :environment do
    puts "Ordonnance"
    n_ordonnance.times do |n|
      if n == 1
        numero = "a#{n}"
      else 
        numero = "b#{n}"
      end
      pathologie = "path #{n}"
      date = Date.today
      nombre_seances = n
      o = Ordonnance.create(:numero => numero,
                         :pathologie => pathologie, 
                         :date => date,
                         :nombre_seances => nombre_seances ,
                         :users => User.search_all("p"),
                         :adresse => Adresse.find(1+SecureRandom.random_number(n_adresse-1)),
                         :patient => Patient.find(1+SecureRandom.random_number(n_patient-1)),
                         :medecin => Medecin.find(1+SecureRandom.random_number(n_medecin-1))
                         )
      puts o.errors unless o.errors.size < 1                  
    end
  end
end

namespace :db do
  desc "Remplit la base avec des seances"
  task :populate_seances => :environment do
    puts "Seances"
    n_seance.times do |n|
      s = Seance.create(:date_debut => Date.today,
                    :commentaire => "Lorem ipsum blablabla ",
                    :duree => 1,
                    :paye => false,
                    :a_domicile => false,
                    :ordonnance => Ordonnance.find(1+SecureRandom.random_number(n_ordonnance-1)),
                    :user => User.find(1+SecureRandom.random_number(n_user-1)),
                    :patient => Patient.find(1+SecureRandom.random_number(n_patient-1))
      )
      puts s.errors unless s.errors.size < 1 
    end
  end
end

namespace :db do
  desc "Remplit la base avec des departements"
  task :populate_departement => :environment do 
    puts "Departement" 
    n_departement.times do |n|
      d = Departement.create(:numero => n.to_s, :nom => Faker::Name.name.split[0])
      puts d.errors unless d.errors.size < 1
    end
  end
end

namespace :db do
  desc "Remplit la base avec des Villes"
  task :populate_ville => :environment do 
    puts "Ville" 
    99.times do |n|
      v = Ville.create(:nom => Faker::Name.name.split[0])
      puts v.errors unless v.errors.size < 1
    end
  end
end

namespace :db do
  desc "Remplit la base avec des Codes Insee, Code Postal"
  task :populate_code_insee_postal => :environment do
    puts "Code Insee Postals"  
    n_code_insee.times do |n|
      ci = CodeInsee.create :numero => n.to_s, 
                       :ville => Ville.find(1+SecureRandom.random_number(n_ville-1)),
                       :departement => Departement.find(1+SecureRandom.random_number(n_departement-1))             
      puts ci.errors unless ci.errors.size < 1
      cp = CodePostal.create :numero => n.to_s,
                        :code_insee=> CodeInsee.last
      puts cp.errors unless cp.errors.size < 1
    end
  end
end


namespace :db do
  desc "Remplit la base d'adresse"
  task :populate_adresse => :environment do  
    n_adresse.times do |n|
      Adresse.create :numero => "#{n} - #{SecureRandom.random_number(n)}",
                     :rue => Faker::Name.name,
                     :complement_adresse => Faker::Name.name,
                     :code_insee =>CodeInsee.find(1+ SecureRandom.random_number(n_code_insee -1))
      
    end
  end
end

=begin
=end
namespace :db do
  desc "Remplit la base medecins"
  task :populate_medecin => :environment do  
    n_medecin.times do |n|
      nomprenom  = Faker::Name.name.split
      nom = nomprenom[0]
      prenom = nomprenom[1]
      email = Faker::Internet.email
      telephone = Faker::PhoneNumber.phone_number
      Medecin.create :nom => nom,
                    :prenom => prenom,
                    :email => email,
                    :telephone => telephone,
                    :adresse => Adresse.find(1+ SecureRandom.random_number(n_adresse-1))
    end
  end
end 
namespace :db do
  desc "Remplit la base patient et de carte vitale"
  task :populate_patient => :environment do  
    n_patient.times do |n|
      nomprenom  = Faker::Name.name.split
      nom = nomprenom[0]
      prenom = nomprenom[1]
      email = Faker::Internet.email
      telephone = Faker::PhoneNumber.phone_number
      CarteVitale.create :numero_secu => "111100000000X00100#{n}"
      Patient.create :nom => nom,
                    :prenom => prenom,
                    :email => email,
                    :telephone => telephone,
                    :adresse => Adresse.find(1 + SecureRandom.random_number(n_adresse-1)),
                    :date_naissance => Date.today,
                    :carte_vitale => CarteVitale.last             
    end
  end
end

