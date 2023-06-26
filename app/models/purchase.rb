class Purchase < ApplicationRecord
    belongs_to :client
    has_many :purchase_items
    has_many :products, through: :purchase_items
  
    accepts_nested_attributes_for :purchase_items

    def self.montly_buyer_listing
        query = <<-SQL
        SELECT strftime('%Y-%m', purchases.created_at) AS month,
                clients.name AS user_name,
                MAX(purchases.total_value) AS total_spent
        FROM purchases
        JOIN clients ON clients.id = purchases.client_id
        GROUP BY month
        SQL
    
        results = ActiveRecord::Base.connection.execute(query)
        resultFilter = results.map { |row| { month: row['month'], user_name: row['user_name'], total_spent: row['total_spent'] } }
        resultFilter
    end

end
