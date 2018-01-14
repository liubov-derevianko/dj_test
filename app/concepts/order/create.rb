require_dependency("#{File.dirname(__FILE__)}/create_form.rb")
module Core
  module Order
    class Create < CreateForm
      step Contract::Validate()
      step Contract::Persist()
      step :process!

      def process!(options)
        set_created_state(options['contract.default'])
      end

      def set_created_state(model)

        model.state = 'created'
        model.save
      end
    end
  end
end