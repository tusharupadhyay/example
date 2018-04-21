xml.instruct!
xml.terminals do
  @terminals.each do |terminal|
    xml.terminal do
      xml.id terminal.id
      xml.name terminal.name
      xml.description terminal.description
      xml.created_at terminal.created_at
      xml.updated_at terminal.updated_at
      xml.type terminal.type
      xml.operating_system terminal.operating_system
    end
  end
end
