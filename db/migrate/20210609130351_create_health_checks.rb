class CreateHealthChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :health_checks do |t|
      t.decimal :templature, precision: 3, scale:1
      t.string :respiratory_symptom
      t.string :throat_nasus_eyes_symptom
      t.string :digestive_symptom
      t.string :other
      t.string :memo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
