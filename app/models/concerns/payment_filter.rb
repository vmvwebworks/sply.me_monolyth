module PaymentFilter
  extend ActiveSupport::Concern
  included do
    scope :incomming_payments, -> (provider_id) { where( provider_id: provider_id )}
    scope :outcomming_payments, -> (payer_id) { where( payer_id: payer_id )}
    scope :pending_payments, -> { where(state: "pending") }
    scope :done_payments, -> { where(state:"paid") }
  end
end
