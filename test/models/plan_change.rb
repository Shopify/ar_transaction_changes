module TracksTransactionChanges
  extend ActiveSupport::Concern
  include ArTransactionChanges

  included do
    attr_accessor :stored_transaction_changes

    after_commit { @stored_transaction_changes = transaction_changed_attributes.to_h }
  end
end

class PlanChange < ActiveRecord::Base
  self.table_name = "accounts"

  include TracksTransactionChanges
end
