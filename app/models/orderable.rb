class Orderable < ApplicationRecord
  belongs_to :crm
  belongs_to :cart
  def total
    crm.price * quantity
  end
end
