require_relative "contact"
require_relative "roledex"

class CRM < Contact
  def initialize
    @roledex = Roledex.new
  end

  def main_menu
    print_main_menu #Prints the main menu
    user_selected = gets.to_i #Retrieves the user input
    call_option(user_selected) #Call the method that the user chose
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
    #ADD CONTACT TO SYSTEM
    add_new_contact if user_selected == 1
    #MODIFY EXISTING CONTACT IN THE SYSTEM
    modify_existing_contact if user_selected == 2
    #DELETE CONTACT IN THE SYSTEM
    delete_contact if user_selected == 3
    #DISPLAY CONTACT THAT IS STORED IN THE SYSTEM
    display_contacts if user_selected == 4
    #DISPLAY A SPECIFIC CONTACTS SPECIFIC ATTRIBUTE
    display_attribute if user_selected == 5
    #BUT OFCOURSE, EXIT THE DAMN PROGRAM HAHAH
    exit_program if user_selected == 6
  end

  def add_new_contact
    print "Enter your first name: "
    first_name = gets.chomp #Input Retrieval
    print "Enter your last name: "
    last_name = gets.chomp #Input Retrieval
    print "Enter your email address: "
    email = gets.chomp #Input Retrieval
    print "Enter a note: "
    note = gets.chomp #Input Retrieval
    #Create the object with all the attributes of the contact
    contact = Contact.new(first_name, last_name, email, note)
    #Call the roledex's ADD function to add the contact info to the system
    @roledex.add_contact(contact)
    puts "Press ENTER to continue"
  end

  def modify_existing_contact
    print "Enter id of user you would like to edit: "
    id = gets.chomp.to_i #Input Retrieval
    #Pass the id from the user input to roledex's FIND function to locate that specific entry
    contact = @roledex.find(id)
    #Call the roledex's MODIFY function to adjust an already existing entry in the system
    @roledex.modify_contact(contact)
  end

  def delete_contact
    print "Enter the id of the contact you would like to remove: "
    contact_id = gets.chomp.to_i #Input Retrieval
    #Pass in the id to roledex's FIND function and assign the return value -> 'to_be_removed'
    to_be_removed = @roledex.find(contact_id)
    #Call the roledex's DELETE function to remove the entry from the system
    @roledex.delete_contact(to_be_removed)
  end

  def display_contacts
    print "Enter contact id: "
    contact_id = gets.chomp.to_i #Input Retrieval
    #Pass the id to roledex's FIND function and assign the return value -> 'contact'
    contact = @roledex.find(contact_id)
    #Call the roledex's DISPLAY_ALL function to display the specified contact stored in the system
    @roledex.display_all_contacts(contact)
  end

  def display_attribute
    print "Enter contact id: "
    contact_att = gets.chomp.to_i #Input Retrieval
    #Pass the id to roledex's FIND function and assign the return value -> 'contact'
    contact = @roledex.find(contact_att)
    #Call the roledex's DISPLAY_INFO_BY_ATTRIBUTE function to display specific info on a single entry
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