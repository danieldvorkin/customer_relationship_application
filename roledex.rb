class Roledex < Contact
  attr_accessor :id, :contact

	def initialize
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find (contact_id)
    contact = @contacts.find do |contacts|
      contacts.id == contact_id
    end
    return contact
  end

  def modify_contact(contact)
    puts "Enter the id of the user you would like to modify:"
    puts contact.to_s
    puts "Is this the correct contact y/n?"
    user_choice = gets.chomp

    if user_choice == "y" or "Y"
      puts "What would you like to change?"
      puts "[1] First Name"
      puts "[2] Last Name"
      puts "[3] E-Mail"
      puts "[4] Notes"
      print "Enter your selection: "
      user_option = gets.chomp.to_i
      if user_option == 1
        puts "Enter the first name: "
        contact.first_name = gets.chomp
      elsif user_option == 2
        puts "Enter the last name: "
        contact.last_name = gets.chomp
      elsif user_option == 3
        puts "Enter the E-Mail: "
        contact.email = gets.chomp
      elsif user_option == 4
        puts "Enter the Notes: "
        contact.note = gets.chomp
      end
    elsif user_choice.downcase == "n"
      main_menu
    end
    puts "Press ENTER to continue...."
  end

  def display_all_contacts(contact)
    puts "#{@id}: #{contact.first_name}, #{contact.last_name}, #{contact.email}, #{contact.note}"
    puts "Press ENTER to continue...."
  end

  def display_info_by_attribute(contact)
    puts "Enter attribute you want to display"
    puts "[1] - first name"
    puts "[2] - last name"
    puts "[3] - email"
    puts "[4] - note"
    att = gets.chomp.to_i
    if att == 1
      puts "#{@id}: #{contact.first_name}"
    elsif att == 2
      puts "#{@id}: #{contact.last_name}"
    elsif att == 3
      puts "#{@id}: #{contact.email}"
    elsif att == 4
      puts "#{@id}: #{contact.note}"
    else
      puts "I'm sorry but there is no such attribute"
    end
    puts "Press ENTER to continue...."
  end

  def delete_contact(contact)
    @contacts.delete(contact)
    puts "The contact you have chosen has been successfully removed"
    puts "Press ENTER to continue...."
  end
end