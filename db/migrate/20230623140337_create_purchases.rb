class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :client, null: false, foreign_key: true
      t.string :proof_document, null: false
      t.decimal :total_value, null: false

      t.timestamps
    end

    create_join_table :purchases, :products do |t|
      t.index [:purchase_id, :product_id]
      t.index [:product_id, :purchase_id]
    end
  end
end