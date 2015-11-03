class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :email, limit: 50
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50

      t.timestamps
    end
  end
end
