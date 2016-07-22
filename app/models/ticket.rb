class Ticket < Product
  def formatted_event_datetime
    self[:event_datetime].strftime("%d/%m/%Y - %H:%M:%S") if !self[:event_datetime].nil?
  end
end
