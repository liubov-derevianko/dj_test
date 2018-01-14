module Core
  module Order
    class UpdateForm < Trailblazer::Operation
      extend Contract::DSL
      contract do
        property :name
        property :state
        property :owner_email
      end

      initialize_pipetree!
      step Model(::Order, :find)
      step Contract::Build()

    end
  end
end