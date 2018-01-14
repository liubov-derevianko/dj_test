class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private

  def parse_result(result)
    [result['contract.default'], result['model']]
  end
end
