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
  { number: "101", room_type: 0, price: 100, status: 1 },
  { number: "102", room_type: 1, price: 150, status: 0 },
  { number: "103", room_type: 2, price: 250, status: 1 },
  { number: "104", room_type: 0, price: 90,  status: 0 },
  { number: "105", room_type: 1, price: 160, status: 1 }
])

Guests.create!([
  { first_name: "Damian", last_name: "Vega", email: "devega@miuandes.cl", phone: "+56 9 5422 7287", document_id: "21.671.670-1" },
  { first_name: "María", last_name: "Gómez", email: "maria@example.com", phone: "987654321", document_id: "22j222" },
  { first_name: "Pedro", last_name: "López", email: "pedro@example.com", phone: "555555555", document_id: "33b333" }
])

Services.create!([
  { name: "Cleaning", price: 20, is_active: true },
  { name: "Spa", price: 50, is_active: false },
  { name: "Laundry", price: 10, is_active: true }
])

Reservations.create!([
  { code: "ABC123", guest_id: 123, room_id: 312, check_in: Date.today, check_out: Date.today + 2 , status: 0, adults: 2, children: 0 },
  { code: "DEF456", guest_id: 645, room_id: 532, check_in: Date.today + 3, check_out: Date.today + 4, status: 0, adults: 1, children: 1 }
])

ServiceUsages.create!([
  { reservation_id: 5345, service_id: 1235, quantity: 2, used_at: Date.today + 5, note: "En efecto, funciona" },
  { reservation_id: 1241, service_id: 1234, quantity: 1, used_at: Date.today + 6, note: "brigido siono" }
])

Invoices.create!([
  { reservation_id: 111, nights_subtotal: 23, services_subtotal: 121, tax: 33, total: 1212, issued_at: Date.today + 7, status: "yo caxo que pago" },
  { reservation_id: 222, nights_subtotal: 32, services_subtotal: 244, tax: 44, total: 1231, issued_at: Date.today + 8, status: "este loquito no pago, ojo" }
])
