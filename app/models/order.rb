class Order < ApplicationRecord
  enum state: { created: 0, processed: 1, delivered: 2 }
end
