require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def status_changed_email
    @order = Order.first
   mail = UserMailer.status_changed_email(@order)
  end
end
