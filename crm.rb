require_relative 'rolodex.rb'

class CRM
  attr_accessor :name

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      break if user_selected == 6
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then delete_contact
    when 4 then display_contacts
    when 5 then display_attribute
    else
      puts "Please input a number on the menu"
    end
  end

  def add_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    @rolodex.add_contact(first_name, last_name, email, note)
  end

  def modify_contact
    print "Please enter the id number of the contact you'd like to modify (if you don't know the id number, display all contacts first) "
    contact_id = gets.chomp.to_i

    @rolodex.contact_find(contact_id, "m")

  end

  def delete_contact
    print "Please enter the id number of the contact you'd like to delete (if you don't know the id number, display all contacts first) "
    contact_id = gets.chomp.to_i

    @rolodex.contact_find(contact_id, "dc")
  end

  def display_attribute
    print "Please enter the id number of the contact you'd like to view an attribute of (if you don't know the id number, display all contacts first) "
    contact_id = gets.chomp.to_i

    @rolodex.contact_find(contact_id, "da")
  end

  def display_contacts
    @rolodex.display_contacts
  end

  def self.run(name)
    crm = CRM.new(name)
    crm.main_menu
  end

end

CRM.run("my CRM")