require 'faker'

namespace :db do
  desc "Rempli la base avec de faux utilisateurs"
  task :populate_users => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:nom => "Besson",
                 :prenom => "Pierre",
                 :email => "pierre.besson7@gmail.com",
                 :password => "kineapp",
                 :password_confirmation => "kineapp")
    admin.toggle!(:admin)
    99.times do |n|
      nomprenom  = Faker::Name.name.split
      nom = nomprenom[0]
      prenom = nomprenom[1]
      email = "exemple-#{n+1}@ikine.com"
      password  = "kineapp"
      User.create!(:nom => nom,
                   :prenom => prenom,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
