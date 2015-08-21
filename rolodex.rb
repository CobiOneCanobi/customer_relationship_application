require_relative 'contact.rb'

class Rolodex
  attr_accessor :first_name, :last_name, :email, :note
  @@id = 1000

  def initialize
    @contacts = []
  end


  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @contacts << contact
    @@id += 1
    puts "Successfully added"
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


  def modify_contact(contact_index)

    while true
      puts "[1] First Name"
      puts "[2] Last Name"
      puts "[3] Email"
      puts "[4] Note"
      puts "[5] Done"
      modify = gets.chomp.to_i

      case modify
      when 1
        print "Enter a new first name: "
        @contacts[contact_index].first_name = gets.chomp
      when 2
        print "Enter a new last name: "
        @contacts[contact_index].last_name = gets.chomp
      when 3
        print "Enter a new first email: "
        @contacts[contact_index].email = gets.chomp
      when 4
        print "Enter a new note: "
        @contacts[contact_index].note = gets.chomp
      when 5
        break
      else
       puts "Please input a number on the menu"
      end
    end
  end


  def delete_contact(contact_index)
    @contacts.delete_at(contact_index)
    puts "Successfully deleted"
  end

  def display_attribute(contact_index)
    while true
      puts "[1] First Name"
      puts "[2] Last Name"
      puts "[3] Email"
      puts "[4] Note"
      puts "[5] Done"
      modify = gets.chomp.to_i

      case modify
      when 1
        puts "First Name: #{@contacts[contact_index].first_name}"
      when 2
        puts "Last Name: #{@contacts[contact_index].last_name}"
      when 3
        "Email: #{@contacts[contact_index].email}"
      when 4
        puts "Note: #{@contacts[contact_index].note}"
      when 5
        break
      else
       puts "Please input a number on the menu"
      end
    end
  end


  def contact_find(contact_id, method)
    contact_index = @contacts.find_index{|item| contact_id == item.id}

    if contact_index != nil
      modify_contact(contact_index) if method == "m"
      delete_contact(contact_index) if method == "dc"
      display_attribute(contact_index) if method == "da"
    else
      puts "That is not a contact id number that exists"
    end
  end
end