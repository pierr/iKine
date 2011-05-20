# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110519172913) do

  create_table "adresses", :force => true do |t|
    t.string   "nom"
    t.integer  "ville_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "civilites", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departements", :force => true do |t|
    t.string   "numero"
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medecins", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.string   "telephone"
    t.integer  "adresse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordonnances", :force => true do |t|
    t.string   "numero"
    t.string   "pathologie"
    t.datetime "date"
    t.string   "prise_en_charge"
    t.string   "type_prise_en_charge"
    t.boolean  "paye"
    t.integer  "nombre_seances"
    t.string   "bilan"
    t.string   "caisse"
    t.string   "mutuelle"
    t.integer  "patient_id"
    t.integer  "medecin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.string   "telephone"
    t.datetime "date_naissance"
    t.string   "pathologie"
    t.integer  "numero_secu"
    t.integer  "civilite_id"
    t.integer  "adresse_id"
    t.integer  "medecin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rdvs", :force => true do |t|
    t.datetime "date"
    t.integer  "duree"
    t.boolean  "a_domicile"
    t.boolean  "nouveau_patient"
    t.string   "telephone"
    t.string   "email"
    t.string   "commentaire"
    t.integer  "patient_id"
    t.integer  "adresse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seances", :force => true do |t|
    t.datetime "date_debut"
    t.integer  "duree"
    t.string   "commentaire"
    t.boolean  "paye"
    t.boolean  "a_domicile"
    t.integer  "ordonnance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.string   "telephone"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "villes", :force => true do |t|
    t.string   "nom"
    t.string   "code_postal"
    t.integer  "departement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
