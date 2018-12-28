require 'rails_helper'

RSpec.describe "Search page",  :type => :feature , :aggregate_failures => true  do

  before(:all) do
    Transaction.delete_all
  end
  after(:all) do
    Transaction.delete_all
  end

  def persistCapy()
    Capybara.current_session.instance_variable_set(:@touched, false)
  end

  #debug Capybara.default_max_wait_time = 10

  context "performs search with Ropsten", :ropsten => true do
    before(:all) do
      visit ethereum_path
    end
    it "displays the correct data" do
      fill_in "search-transaction" , with: "0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a"
      choose "Ropsten"
      click_button "Search"
      expect(current_path).to eq(ethereum_path)
      expect(find('#overview')).to have_content('Success')
      expect(page).to have_content("0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a")
      expect(page).to have_content("Success")
      expect(page).to have_content("4588323")
      expect(page).to have_content("0xbdfeff9a1f4a1bdf483d680046344316019c58cf")
      expect(page).to have_content("21000")
      end
  end

  context "performs search with Mainnet", :mainnet => true do
    before(:all) do
      Capybara.default_max_wait_time = 2
      visit ethereum_path
    end
    it "displays the correct data" do
      fill_in "search-transaction" , with: "0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250"
      choose "Mainnet"
      click_button "Search"
      expect(current_path).to eq(ethereum_path)
      expect(page.has_content?("0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250")).to be true
      expect(page.has_content?("0x6b70b1ac178b2ce967673223d7321cb5de9da657")).to be true
      expect(page.has_content?("Success")).to be true
      expect(page.has_content?("6849773")).to be true
      expect(page.has_content?("0xf00d27c64e125aa2da41298edd3660ac077d1e91")).to be true
      expect(page.has_content?("21000")).to be true
    end
  end

  context "yields error message if it" do
    before(:all) do
      visit ethereum_path
    end
    it "is Ropsten transaction searched on Mainnet" do
      fill_in "search-transaction" , with: "0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a"
      choose "Mainnet"
      click_button "Search"
      expect(current_path).to eq(ethereum_path)
      expect(page.has_content?("Success")).to be false
      persistCapy()
    end
    it "is Mainnet transaction searched on Ropsten" do
      fill_in "search-transaction" , with: "0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250"
      choose "Ropsten"
      click_button "Search"
      expect(current_path).to eq(ethereum_path)
      expect(page.has_content?("Success")).to be false
      persistCapy()
    end
    it "is given no input at all" do
      fill_in 'search-transaction', with: ""
      click_button "Search"
      expect(page.has_content?("TxReceipt Status:")).to be false
      persistCapy()
    end
    it "is given no input (Ropsten)" do
      fill_in 'search-transaction', with: ""
      choose "Ropsten"
      click_button "Search"
      expect(page.has_content?("TxReceipt Status:")).to be false
      persistCapy()
    end
  end
end
