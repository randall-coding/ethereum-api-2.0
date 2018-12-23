require 'rails_helper'

RSpec.describe TransactionController, type: :controller do

   describe "caching" do
  #   describe "stores data if not already stored" do
  #     it "has nil @cached variable" do
  #       get :index
  #       expect(@cached).to be_nil
  #     end
  #   end
    describe "uses @cached if already in database" do
      fixtures :transactions
      it "should be a Transaction object" do
        post :index, :params =>{:hash=>"0x79f333748c61a896d21c6f4d8dd9c8431107be0ba12b440a92fa4da058b3810d",:mode=>"mainnet"}
        expect(@controller.view_assigns['cached'].txHash).to eq("0x79f333748c61a896d21c6f4d8dd9c8431107be0ba12b440a92fa4da058b3810d")
        end
    end
  end #end caching
end #end TransactionController
