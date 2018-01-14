class UserMailer < ApplicationMailer

  def status_changed_email(order)
    @order = order
    mail(to: order.owner_email, subject: 'DJ_TEST: Order status changed')
  end
end
