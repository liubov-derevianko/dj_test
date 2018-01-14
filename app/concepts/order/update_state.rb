module Core
  module Order
    class UpdateState < Trailblazer::Operation
      extend Contract::DSL
      contract do
        property :id
        property :state
      end

      initialize_pipetree!
      step Model(::Order, :find)
      step Contract::Build()
      step Contract::Validate()
      step Contract::Persist()
      step :process!
      step :notify_user

      def process!(options, params:, **)
        options['model'].state = params['state']
        options['model'].save
      end

      def notify_user(options, params:, **)
        EventBus.announce(:order_state_changed, order: options['model'])
        # NotificationJob.perform_later(options['model'])
        # UserMailer.status_changed_email(options['model']).deliver_later
      end
    end
  end
end