class Customer < User
  has_many :tickets, class_name: 'Ticket', foreign_key: 'customer_id'
end
