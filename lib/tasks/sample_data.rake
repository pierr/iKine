require 'faker'

namespace :db do
  desc "Remplit la base avec pleins de faux trucs en appelant les autres taches de ce fichier apres avoir vider la base"
  task :populate => :environment do  
    Rake::Task['db:reset'].invoke
    Rake::Task['db:populate_users'].invoke
    Rake::Task['db:populate_ordonnances'].invoke
    Rake::Task['db:populate_ville'].invoke
    Rake::Task['db:populate_seances'].invoke
    Rake::Task['db:populate_departement'].invoke
    Rake::Task['db:populate_code_insee_postal'].invoke
  end
end
namespace :db do
  desc "Remplit la base avec de faux utilisateurs"
  task :populate_users => :environment do
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
    99.times do |n|
      
      nomprenom  = Faker::Name.name.split
      nom = nomprenom[0]
      prenom = nomprenom[1]
      email = Faker::Internet.email
      password  = "kineapp"
      User.create!(:nom => nom,
                   :prenom => prenom,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end

namespace :db do
  desc 'Cree une ordonnance'
  task :populate_ordonnances => :environment do
    2.times do |n|
      if n == 1
        numero = "a#{n}"
      else 
        numero = "b#{n}"
      end
      pathologie = "path #{n}"
      date = Date.today
      nombre_seances = n
      Ordonnance.create!(:numero => numero,
                         :pathologie => pathologie, 
                         :date => date,
                         :nombre_seances => nombre_seances )
    end
  end
end

namespace :db do
  desc "Remplit la base avec des seances"
  task :populate_seances => :environment do
    4.times do |n|
      Seance.create(:date_debut => Date.today,
                    :commentaire => "Lorem ipsum blablabla"
      )
    end
  end
end

namespace :db do
  desc "Remplit la base avec des departements"
  task :populate_departement => :environment do  
    99.times do |n|
      Departement.create(:numero => n.to_s, :nom => Faker::Name.name.split[0])
    end
  end
end
namespace :db do
  desc "Remplit la base avec des Villes"
  task :populate_ville => :environment do  
    99.times do |n|
      Ville.create(:nom => Faker::Name.name.split[0])
    end
  end
end
namespace :db do
  desc "Remplit la base avec des Codes Insee, Code Postal"
  task :populate_code_insee_postal => :environment do  
    99.times do |n|
      CodeInsee.create :numero => n.to_s, 
                     :ville_id => Ville.find(1+SecureRandom.random_number(90)).id,
                     :departement_id => Departement.find(1+SecureRandom.random_number(90)).id
                     
      CodePostal.create :numero => n.to_s,
                        :code_insee_id => CodeInsee.last.id
    end
  end
end