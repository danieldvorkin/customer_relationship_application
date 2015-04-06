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
    @contacts.find do |contacts|
      contacts.id == contact_id
    end
  end

  def modify_contact

  end

  def display_all_contacts(contact)
  	puts "#{@id}: #{@contacts}"
    puts "Press ENTER to continue"
  end

  def display_particular_contact

  end

  def display_info_by_attribute(contact_id)
    puts "Enter attribute you want to display"
    puts "[1] - first name"
    puts "[2] - last name"
    puts "[3] - email"
    puts "[4] - note"
    att = gets.chomp.to_i
    if att == 1
      puts "#{@id}: #{@first_name}"
    elsif att == 2
      puts "#{@id}: #{@last_name}"
    elsif att == 3
      puts "#{@id}: #{@email}"
    elsif att == 4
      puts "#{@id}: #{@note}"
    else
      puts "I'm sorry but there is no such attribute"
    end
    puts "Press ENTER to continue"
  end

  def delete_contact
    puts "Enter the id of the contact you would like to remove: "
    contact = gets.chomp.to_s
    tobe_gone_contact = find(contact)

  end
end