
Client.create(name: "João", birth_date: Date.new(1990, 1, 10))
Client.create(name: "Maria", birth_date: Date.new(1995, 3, 22))
Client.create(name: "Pedro", birth_date: Date.new(1988, 7, 5))
Client.create(name: "José", birth_date: Date.new(2000, 4, 16))

Product.create(name: "Mouse", price: 29.90, description: "Mouse sem fio")
Product.create(name: "Teclado", price: 79.90, description: "Teclado para computador")
Product.create(name: "Cadeira Gamer", price: 999.90, description: "Cadeira Gamer super bacana")
Product.create(name: "Notebook", price: 2999.90, description: "Notebook Gamer")

## 
client1 = Client.find(3)

purchase1 = Purchase.create!(
  client: client1,
  proof_document: "documento1.pdf",
  total_value: 19999.98,
  created_at: '2022-01-01'
)

purchase1.purchase_items.create!(
  product_id: 3,
  amount: 2,
  value: 9999.99
)

## 
client2 = Client.find(1)

purchase2 = Purchase.create!(
  client: client2,
  proof_document: "documento2.pdf",
  total_value: 109.8,
  created_at: '2023-01-01'
)

purchase2.purchase_items.create!(
  product_id: 1,
  amount: 1,
  value: 29.9
)

purchase2.purchase_items.create!(
  product_id: 2,
  amount: 1,
  value: 79.9
)
## 
client3 = Client.find(2)

purchase3 = Purchase.create!(
  client: client3,
  proof_document: "documento1.pdf",
  total_value: 500,
  created_at: '2022-01-01'
)

purchase3.purchase_items.create!(
  product_id: 2,
  amount: 1,
  value: 79.99
)
