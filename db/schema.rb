# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_24_205117) do
  create_table "checklist_tarefas", force: :cascade do |t|
    t.integer "checklist_id", null: false
    t.integer "tarefa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_checklist_tarefas_on_checklist_id"
    t.index ["tarefa_id"], name: "index_checklist_tarefas_on_tarefa_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checklists_postos", id: false, force: :cascade do |t|
    t.integer "posto_id", null: false
    t.integer "checklist_id", null: false
  end

  create_table "checklists_tarefas", id: false, force: :cascade do |t|
    t.integer "checklist_id", null: false
    t.integer "tarefa_id", null: false
  end

  create_table "posto_checklists", force: :cascade do |t|
    t.integer "posto_id", null: false
    t.integer "checklist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_posto_checklists_on_checklist_id"
    t.index ["posto_id"], name: "index_posto_checklists_on_posto_id"
  end

  create_table "postos", force: :cascade do |t|
    t.string "cliente"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "checklist_id"
    t.index ["checklist_id"], name: "index_postos_on_checklist_id"
    t.index ["usuario_id"], name: "index_postos_on_usuario_id"
  end

  create_table "roteiros", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posto_id"
    t.index ["posto_id"], name: "index_roteiros_on_posto_id"
  end

  create_table "roteiros_usuarios", id: false, force: :cascade do |t|
    t.integer "roteiro_id", null: false
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roteiro_id", "usuario_id"], name: "index_roteiros_usuarios_on_roteiro_id_and_usuario_id", unique: true
    t.index ["roteiro_id"], name: "index_roteiros_usuarios_on_roteiro_id"
    t.index ["usuario_id"], name: "index_roteiros_usuarios_on_usuario_id"
  end

  create_table "tarefas", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "checklist_items"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.integer "re"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["re"], name: "index_usuarios_on_re", unique: true
  end

  add_foreign_key "checklist_tarefas", "checklists"
  add_foreign_key "checklist_tarefas", "tarefas"
  add_foreign_key "posto_checklists", "postos", on_delete: :cascade
  add_foreign_key "postos", "checklists"
  add_foreign_key "postos", "usuarios"
  add_foreign_key "roteiros", "postos"
  add_foreign_key "roteiros_usuarios", "roteiros"
  add_foreign_key "roteiros_usuarios", "usuarios"
end
