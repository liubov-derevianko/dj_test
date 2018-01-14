module Notifications
  class SmsNotifications

    def order_state_changed(payload)
      order = payload[:order]
      ::NotificationJob.perform_later(order)
    end
  end
end