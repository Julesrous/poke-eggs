class Order < ApplicationRecord
  belongs_to :user
  belongs_to :pokegg
  monetize :amount_cents
end
