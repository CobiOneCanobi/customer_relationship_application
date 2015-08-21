require_relative 'contact.rb'

class Rolodex
  attr_accessor :first_name, :last_name, :email, :note
  @@id = 1000

  def initialize
    @contacts = []
  end

  def contacts
    @contacts
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @contacts << contact
    @@id += 1
  end

  def display_contacts
    @contacts.each do |contact|
      puts "id: #{contact.id}"
      puts "first name: #{contact.first_name}"
      puts "last name: #{contact.last_name}"
      puts "email: #{contact.email}"
      puts "note: #{contact.note}"
      puts ""
    end
  end
end