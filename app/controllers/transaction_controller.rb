#Hello this is Randall.  Bear in mind I knew nothing about Ethereum before making this project.
  #...but I learned about Ethereum as I as I went and I really enjoyed it.  Thanks for the project.

class TransactionController < ApplicationController
require 'awesome_print'
require 'json'
require 'httparty'

  #The main page function
  def index
    #initialize variables
    @transaction_hash = params[:hash]? params[:hash].strip : 0
    @transaction_response = nil
    if( params[:mode] == "ropsten")
      url = "https://api-ropsten.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=#{@transaction_hash}&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J"
    else
      url = "https://api.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=#{@transaction_hash}&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J"
    end

    @cached = Transaction.find_by(Thash:@transaction_hash)

    #make API call, unless cached already
    if(@cached)
      #use cached
      @transaction_response = JSON.parse @cached.data
    else
      #New API call
      #this API call works for both internal and external.  More info at https://etherscan.io/apis#proxy  'eth_getTransactionByHash'
      @transaction_response = JSON.parse HTTParty.get("#{url}").response.body
      @transaction_JSON = @transaction_response.to_json
      #save if valid response
      if (@transaction_hash['result'])
        #Make new transaction
        t = Transaction.new
        t.Thash =@transaction_hash
        t.data=@transaction_JSON
        if (t.save)
          puts "transaction saved"
        else
          puts "transaction not saved"
        end
      end
    end #end if

    ###alternative API calls
    #Search by address, not by transaction hash @transaction_response = JSON.parse HTTParty.get('http://api.etherscan.io/api?module=account&action=txlist&address=0xbeef281b81d383336aca8b2b067a526227638087&sort=asc').response.body
    #Search by Hash number, but only for internal transactions @transaction_response = JSON.parse HTTParty.get("https://api.etherscan.io/api?module=account&action=txlistinternal&txhash=#{@transaction_hash}&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J").response.body
    #Search Ropsten https://api-ropsten.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J
  end #end index

end #end class
