require 'faker'

namespace :db do
  desc "Rempli la base avec pleins de faux trucs en appelant les autres taches de ce fichier apres avoir vider la base"
  task :populate => :environment do  
    Rake::Task['db:reset'].invoke
    Rake::Task['db:populate_users'].invoke
    Rake::Task['db:populate_ordonnances'].invoke
  end
end
namespace :db do
  desc "Rempli la base avec de faux utilisateurs"
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