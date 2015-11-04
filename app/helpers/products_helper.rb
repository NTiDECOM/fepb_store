module ProductsHelper
  def product_select_type_path    
    [[t('models.book.label'), new_book_path], [t('models.cd.label'), new_cd_path], [t('models.dvd.label'), new_dvd_path], [t('models.shirt.label'), new_shirt_path], [t('models.ticket.label'), new_ticket_path]]
  end
end