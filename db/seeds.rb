# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Invoices.destroy_all
ServiceUsages.destroy_all
Reservations.destroy_all
Services.destroy_all
Guests.destroy_all
Rooms.destroy_all

Rooms.create!([
  { number: "101", room_type: 0, price: 100, status: 0 },
  { number: "102", room_type: 1, price: 150, status: 0 },
  { number: "103", room_type: 2, price: 250, status: 0 },
  { number: "104", room_type: 0, price: 90,  status: 0 },
  { number: "105", room_type: 1, price: 160, status: 0 }
])

Guests.create!([
  { first_name: "Juan", last_name: "Pérez", email: "juan@example.com", phone: "123456789", document_id: "11111111" },
  { first_name: "María", last_name: "Gómez", email: "maria@example.com", phone: "987654321", document_id: "22222222" },
  { first_name: "Pedro", last_name: "López", email: "pedro@example.com", phone: "555555555", document_id: "33333333" }
])

Services.create!([
  { name: "Room Service", price: 20, is_active: true },
  { name: "Spa", price: 50, is_active: true },
  { name: "Laundry", price: 10, is_active: true }
])

Reservations.create!([
  { code: "ABC123", guest_id: Guests.first.id, room_id: Rooms.first.id, check_in: Date.today, check_out: Date.today + 2, status: 0, adults: 2, children: 0 },
  { code: "DEF456", guest_id: Guests.second.id, room_id: Rooms.second.id, check_in: Date.today + 1, check_out: Date.today + 3, status: 0, adults: 1, children: 1 }
])

ServiceUsages.create!([
  { reservation_id: Reservations.first.id, service_id: Services.first.id, quantity: 2, used_at: DateTime.now, note: "Extra towels" },
  { reservation_id: Reservations.second.id, service_id: Services.second.id, quantity: 1, used_at: DateTime.now, note: "Massage session" }
])

Invoices.create!([
  { reservation_id: Reservations.first.id, 
    nights_subtotal: 2 * Rooms.first.price, 
    services_subtotal: 2 * Services.first.price, 
    tax: ((2 * Rooms.first.price + 2 * Services.first.price) * 0.19).to_i, 
    total: (2 * Rooms.first.price + 2 * Services.first.price + ((2 * Rooms.first.price + 2 * Services.first.price) * 0.19).to_i), 
    issued_at: DateTime.now, 
    status: "paid" 
  },
  { reservation_id: Reservations.second.id, 
    nights_subtotal: 2 * Rooms.second.price, 
    services_subtotal: 1 * Services.second.price, 
    tax: ((2 * Rooms.second.price + 1 * Services.second.price) * 0.19).to_i, 
    total: (2 * Rooms.second.price + 1 * Services.second.price + ((2 * Rooms.second.price + 1 * Services.second.price) * 0.19).to_i), 
    issued_at: DateTime.now, 
    status: "unpaid" 
  }
])
