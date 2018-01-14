EventBus.subscribe(:order_state_changed,      Notifications::EmailNotifications.new, :order_state_changed)
EventBus.subscribe(:order_state_changed,      Notifications::SmsNotifications.new, :order_state_changed)
# EventBus.subscribe(:order_state_changed,      Notifications::SlackNotifications.new, :order_state_changed)

EventBus.on_error do |listener, payload|
  puts listener.inspect
  puts payload.inspect
  puts payload[:error].inspect
end