require 'rails_helper'
require 'factories/transaction_factory'

RSpec.describe TransactionController, type: :controller, :aggregate_failures => true do
  before(:all) do
    clearDB()
  end
  after(:all) do
    clearDB()
  end

   describe "caching" do
    context "uses cache object if already in database, it" do
      before(:all) do
        cached_transaction = makeTransaction2()
        cached_transaction.save
      end
      it "should be a transaction object" do
        post :index, :params =>{:hash=>"0x79f333748c61a896d21c6f4d8dd9c8431107be0ba12b440a92fa4da058b3810d",:mode=>"mainnet"}
        expect(@controller.view_assigns['cached'].class).to eq(Transaction)
      end
      it "should be the right one" do
        post :index, :params =>{:hash=>"0x79f333748c61a896d21c6f4d8dd9c8431107be0ba12b440a92fa4da058b3810d",:mode=>"mainnet"}
        expect(@controller.view_assigns['cached'].txHash).to eq("0x79f333748c61a896d21c6f4d8dd9c8431107be0ba12b440a92fa4da058b3810d")
      end
    end #happy path

    context "does not use cache object if not found in database, it" do
       it "should be nil (Mainnet)" do
         post :index, :params=> {:hash => "ShouldNotBeFound", :mode => 'mainnet'}
         expect(@controller.view_assigns['cached']).to be_falsey
       end
       it "should be nil (Ropsten)" do
         post :index, :params=> {:hash => "ShouldNotBeFound", :mode => 'ropsten'}
         expect(@controller.view_assigns['cached']).to be_falsey
       end
    end #mistake path

  end #end caching
end #end TransactionController
