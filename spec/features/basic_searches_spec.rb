require 'rails_helper'

RSpec.describe "Search page", :type => [:feature, :request] do
  before {visit root_path}

  describe "performs search with Ropsten" do
    it "displays the correct data" do
      fill_in "search-transaction" , with: "0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a"
      choose "Ropsten"
      click_button "Search"
      current_path.should eq(root_path)
      expect(page.has_content?("0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a"))
      expect(page.has_content?("Success"))
      expect(page.has_content?("4588323"))
      expect(page.has_content?("0xbdfeff9a1f4a1bdf483d680046344316019c58cf"))
      expect(page.has_content?("21000"))
    end
  end

  describe "performs search with Mainnet" do
    it "displays the correct data" do
      fill_in "search-transaction" , with: "0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250"
      choose "Mainnet"
      click_button "Search"
      current_path.should eq(root_path)
      expect(page.has_content?("0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250"))
      expect(page.has_content?("0x6b70b1ac178b2ce967673223d7321cb5de9da657"))
      expect(page.has_content?("Success"))
      expect(page.has_content?("6849773"))
      expect(page.has_content?("0xf00d27c64e125aa2da41298edd3660ac077d1e91"))
      expect(page.has_content?("21000"))
    end
  end

  describe "yields error message if it" do
    it "is Ropsten transaction searched on Mainnet" do
      fill_in "search-transaction" , with: "0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a"
      choose "Mainnet"
      click_button "Search"
      current_path.should eq(root_path)
      expect(page.has_content?("Success")).to be false
    end
    it "is Mainnet transaction searched on Ropsten" do
      fill_in "search-transaction" , with: "0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250"
      choose "Ropsten"
      click_button "Search"
      current_path.should eq(root_path)
      expect(page.has_content?("Success")).to be false
    end
    it "is given no input" do
      fill_in 'search-transaction', with: ""
      choose "Ropsten"
      click_button "Search"
      expect(page.has_content?("TxReceipt Status:")).to be false
    end
  end
end
