class TransactionController < ApplicationController
require 'json'
require 'httparty'
include TransactionHelper

  #The main page function
  def index
    #initialize variables
    @txInfo = {}
    @txInfo['hash'] = params[:hash]? params[:hash].strip : 0
    @txInfo['response'] = nil
    if( params[:mode] == "ropsten")
      #note, in production I would use ENV['eth_apikey'].  apikey is posted as plain text for demonstration.
      @url = "https://api-ropsten.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=#{@txInfo['hash']}&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J"
    else
      @url = "https://api.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=#{@txInfo['hash']}&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J"
    end

    @cached = Transaction.find_by(Thash:@txInfo['hash'])
    #make API call, unless cached already
    unless(@cached)
      #New API call
      api_ethscan()
    else
      #use cached
      @txInfo['response'] = JSON.parse @cached.data
    end #end if

  end #end index
end #end class
