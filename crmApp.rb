class Contact
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end
end

class CRM
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
    display_all_contacts if user_selected == 4
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
  end

  def modify_existing_contact

  end

  def delete_contact
  
  end

  def display_all_contacts

  end

  def display_attribute
  
  end

  def exit_program

  end
end 

a_crm_app = CRM.new
a_crm_app.main_menu
input = gets.chomp
a_crm_app.call_option(input)
