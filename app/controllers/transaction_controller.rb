class TransactionController < ApplicationController
require 'json'
require 'httparty'
include TransactionHelper

  #The main page function
  def index
    return
    unless(params[:hash])
      @request = "get"
    end
    #initialize variables
    @txInfo = {}
    @txInfo['hash'] = params[:hash]? params[:hash].strip : 0
    @txInfo['response'] = nil
    params[:mode] ||= 'mainnet'

    if( params[:mode] == "ropsten")
      #note, in production I would use ENV['eth_apikey'].  apikey is posted as plain text for demonstration.
      @url = "https://api-ropsten.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=#{@txInfo['hash']}&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J"
    else
      @url = "https://api.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=#{@txInfo['hash']}&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J"
    end

    @cached = Transaction.find_by(txHash:@txInfo['hash'])

    unless(@cached)
      #New API call.
      @txInfo['response'] = api_ethscan()
    else
      #use cached
      @txInfo['response'] = JSON.parse @cached.data
    end #end if

    #set status variables
    if(@txInfo['response'])
      @status =  @txInfo['response']['txreceipt_status']
      @status_color = @status.to_i == 1? 'green' : 'red'
      if (@status == '1')
        @status="Success"
      elsif (@status =='0')
        @status="Failed"
      else
        @status = "Available for post BYZANTIUM blocks only"; @status_color = "rgb(255, 88, 0)";
      end
    end

    #debug puts @cached.txHash
    # puts "txInfo......."
    # puts @txInfo
  end #end index
end #end class
