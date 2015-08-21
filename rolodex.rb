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
end