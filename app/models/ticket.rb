class Ticket < Product
  def formatted_event_datetime
    if self[:event_datetime].nil?
      self[:event_datetime] = DateTime.now + 6.months
      self[:event_datetime].strftime("%d/%m/%Y - %H:%M:%S")
    else 
      self[:event_datetime].strftime("%d/%m/%Y - %H:%M:%S")
    end
  end
end
