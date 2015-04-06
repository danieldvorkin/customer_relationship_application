class Roledex < Contact
  attr_accessor :contact, :id
	def initialize
    @contact = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find (contact_id)
    @contats.find do |contact|
      contacts.id == contact_id
    end
  end

  def modify_contact

  end

  def display_all_contacts
  	puts "#{@id}: #{@contact}"
  end

  def display_particular_contact

  end

  def display_info_by_attribute

  end

  def delete_contact

  end
end