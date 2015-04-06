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

  def modify_contact

  end

  def display_all_contacts(contact)
    puts "#{@id}: #{contact.first_name}, #{contact.last_name}, #{contact.email}, #{contact.note}"
    puts "Press ENTER to continue"
  end

  def display_particular_contact(contact)
    puts "#{@id}: #{@contacts}"
    puts "Press ENTER to continue"

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
    puts "Press ENTER to continue"
  end

  def delete_contact
    puts "Enter the id of the contact you would like to remove: "
    contact = gets.chomp.to_s
    tobe_gone_contact = find(contact)
    contact.delete_at(tobo_gone_ contact)
  end
end