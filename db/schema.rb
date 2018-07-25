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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_25_141953) do

  create_table "gatekeeper_department_roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["department_id"], name: "index_gatekeeper_department_roles_on_department_id"
  end

  create_table "gatekeeper_departments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gatekeeper_identities", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email"
    t.datetime "last_login"
    t.index ["email"], name: "index_gatekeeper_identities_on_email", unique: true
  end

  create_table "gatekeeper_identity_roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "identity_id", null: false
    t.integer "role_id", null: false
    t.integer "department_id"
    t.string "assigned_by"
    t.index ["department_id"], name: "index_gatekeeper_identity_roles_on_department_id"
    t.index ["identity_id", "role_id", "department_id"], name: "gatekeeper_combined_identity_role_index", unique: true
    t.index ["identity_id"], name: "index_gatekeeper_identity_roles_on_identity_id"
    t.index ["role_id"], name: "index_gatekeeper_identity_roles_on_role_id"
  end

  create_table "gatekeeper_permissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "method"
    t.string "controller", null: false
    t.string "action", null: false
    t.string "path", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "engine"
    t.index ["method", "controller", "action", "engine"], name: "combined_method_controller_action_index", unique: true
  end

  create_table "gatekeeper_permissions_roles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "permission_id", null: false
    t.integer "role_id", null: false
    t.index ["permission_id", "role_id"], name: "gatekeeper_combined_permission_role_index", unique: true
    t.index ["permission_id"], name: "index_gatekeeper_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_gatekeeper_permissions_roles_on_role_id"
  end

  create_table "gatekeeper_roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "snippets_count", default: 0
    t.index ["name"], name: "index_labels_on_name", unique: true
  end

  create_table "snippets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "language"
    t.integer "tabs", limit: 2
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_snippets_on_label_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
