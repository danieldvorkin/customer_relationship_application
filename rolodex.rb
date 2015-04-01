class Rolodex
	def initialize
    @contact = []
    @id = 1000
  end
  
  def contact
    @contacts
  end

  def add_contact
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def modify_contact

  end

  def display_all_contacts

  end

  def display_particular_contact

  end

  def display_info_by_attribute

  end

  def delete_contact

  end
end