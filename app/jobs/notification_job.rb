class NotificationJob < ApplicationJob
  queue_as :default

  def perform(order)
    client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
    client.messages.create(
        from: ENV["TWILIO_PHONE_NUMBER"],
        to:  ENV["PHONE_NUMBER_TO"],
        body: "Your order state was changed to #{order.state}"
    )
  end
end
