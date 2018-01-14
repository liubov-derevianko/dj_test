module Notifications
  class EmailNotifications

    def order_state_changed(payload)
      order = payload[:order]
      ::UserMailer.status_changed_email(order).deliver_later
    end
  end
end