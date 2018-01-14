class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    result = Core::Order::CreateForm.()
    @form, @model = parse_result(result)
  end

  def create
    result = Core::Order::Create.(params['order'])
    @form, @model = parse_result(result)
    if result.success?
      return redirect_to order_path(@model)
    end
    render action: :new
  end

  def show
    result = Core::Order::UpdateForm.({id: params[:id]})
    @form, @model = parse_result(result)
  end

  def update_state
    result = Core::Order::UpdateState.(params)
    @form, @model = parse_result(result)
    if result.success?
      return redirect_to order_path(@model)
    end
    render action: :show
  end


end
