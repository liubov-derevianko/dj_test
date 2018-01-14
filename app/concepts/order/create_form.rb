module Core
  module Order
    class CreateForm < Trailblazer::Operation
      extend Contract::DSL
      contract do
        property :name
        property :state
        property :owner_email
      end

      initialize_pipetree!
      step Model(::Order, :new)
      step Contract::Build()
    end
  end
end