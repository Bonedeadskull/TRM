class DeviseCreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      ## Database authenticatable
      t.string :first_name
      t.string :last_name
      t.string :username,         null: false, default: ""
      t.string :email
      t.string :encrypted_password, null: false, default: ""
      t.boolean :admin, default: "false"

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :last_sign_in_at

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

    end

    add_index :trainers, :username,             unique: true
    add_index :trainers, :reset_password_token, unique: true
    # add_index :trainers, :confirmation_token,   unique: true
    # add_index :trainers, :unlock_token,         unique: true
  end
end
