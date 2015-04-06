require_relative "contact"
require_relative "roledex"

class CRM < Contact# simulating a view layer
  def initialize
    @roledex = Roledex.new
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
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
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_contact if user_selected == 3
    display_contacts if user_selected == 4
    display_attribute if user_selected == 5
    exit_program if user_selected == 6
  end

  def add_new_contact
    print "Enter your first name: "
    first_name = gets.chomp
    print "Enter your last name: "
    last_name = gets.chomp
    print "Enter your email address: "
    email = gets.chomp
    print "Enter a note: "
    note = gets.chomp

    contact = Contact.new(first_name, last_name, email, note)
    @roledex.add_contact(contact)
    
    puts "Press ENTER to continue"
  end

  def modify_existing_contact
    puts "Enter id of user you would like to edit: "
    id = gets.chomp.to_i
    contact = @roledex.find(id)
    
  end

  def delete_contact
    @contact.delete_at(@id)
  end

  def display_contacts
    print "Enter contact id: "
    contact_id = gets.chomp.to_i
    contact = @roledex.find(contact_id)
    @roledex.display_all_contacts(contact)
  end

  def display_attribute
    print "Enter contact id: "
    contact_att = gets.chomp.to_i
    contact = @roledex.find(contact_att)
    @roledex.display_info_by_attribute(contact)
  end

  def exit_program
    puts "Thank you, come again!! :)"
    abort
  end 
end

a_crm_app = CRM.new
input = 1

while input != 6 
  a_crm_app.main_menu
  input = gets.chomp
  a_crm_app.call_option(input.to_i)
end