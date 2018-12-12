class TransactionController < ApplicationController
require 'json'
require 'httparty'
include TransactionHelper

  #The main page function
  def index
    unless(params[:hash])
      @request = "get"
    end
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

    unless(@cached)
      #New API call.
      @txInfo['response'] = api_ethscan()

    else
      #use cached
      @txInfo['response'] = JSON.parse @cached.data
    end #end if

    #set status variable
    if(@txInfo['response'])
      @status =  @txInfo['response']['txreceipt_status']
      @status_color = @status.to_i == 1? 'green' : 'red'
      if (@status == '1')
        @status="Success"
      elsif (@status =='0')
        @status="Failed"
      else
        @status = "Available for post BYZANTIUM blocks only"; @status_color = "orange";
      end
    end
    puts "\n\n\n\n***FINAL @txInfo"
    puts @txInfo
    puts "\n\n\n\n***FINAL @txInfo"
    puts @txInfo['response'].to_json
  end #end index
end #end class
