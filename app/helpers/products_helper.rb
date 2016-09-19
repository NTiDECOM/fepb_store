module ProductsHelper
  def product_select_type_path
    [
      [t('views.application.select_one'), ''],
      [t('models.book.label'), new_book_path],
      [t('models.cd.label'), new_cd_path],
      [t('models.dvd.label'), new_dvd_path],
      [t('models.shirt.label'), new_shirt_path],
      [t('models.ticket.label'), new_ticket_path]
    ]
  end

  def product_select_tag_types
    [
      [t('models.all_products'), ''],
      [t('activerecord.models.book.other'), 'Book'],
      [t('activerecord.models.cd.other'), 'Cd'],
      [t('activerecord.models.dvd.other'), 'Dvd'],
      [t('activerecord.models.shirt.other'), 'Shirt'],
      [t('activerecord.models.ticket.other'), 'Ticket']
    ]
  end

  def quantity_disabled_for? (product)
    puts " >>>>>>>>>>> quantity_disabled_for? #{product.quantity == 0 || product.quantity == nil}"
    product.quantity == 0 || product.quantity == nil
  end
end
