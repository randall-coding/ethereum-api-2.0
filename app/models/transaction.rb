class Transaction < ApplicationRecord
  require 'httparty'
  validates :Thash ,uniqueness:true, presence:true
  validates :data , presence:true

  def self.test
    t = Transaction.first
    t.full_data('ropsten')
  end

  def full_data(mode)
    transaction_data = JSON.parse self.data
    address = transaction_data['result']['from']

    if(mode == 'mainnet')
      address_response = JSON.parse HTTParty.get("http://api.etherscan.io/api?module=account&action=txlist&address=#{address}&sort=asc").response.body
    else
      address_response = JSON.parse HTTParty.get("http://api-ropsten.etherscan.io/api?module=account&action=txlist&address=#{address}&startblock=0&sort=asc&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J").response.body
    end
    address_transaction = nil
    (address_response['result']).each do |t|
      if t['hash'] == transaction_data['result']['hash']
        address_transaction = t
      end
    end

    if (address_transaction)
      transaction_data['txreceipt_status'] = address_transaction['txreceipt_status']
      transaction_data['timeStamp'] = address_transaction['timeStamp']
    else
      puts "*** error could not find transaction details using from address.  transaction.rb ***"
      transaction_data['txreceipt_status'] = ""
    end

    self.data = transaction_data.to_json
  end #end full_date()
end
