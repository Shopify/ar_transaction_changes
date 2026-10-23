class Account < ActiveRecord::Base
  include ArTransactionChanges

  attr_readonly :handle

  attr_accessor :stored_transaction_changes

  after_commit :store_transaction_changes_for_tests

  def store_transaction_changes_for_tests
    @stored_transaction_changes = transaction_changed_attributes.to_h
  end
end
