require 'rails_helper'

RSpec.describe "BasicSearches", :type => [:feature, :request] do
  describe " perform search with Ropsten" do
    it "displays the corrent data" do
      visit root_path
      fill_in "search-transaction" , with: "0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a"
      choose "Ropsten"
      click_button "Search"
      current_path.should eq(root_path)
      expect(page.has_content?("0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a")).to be true
      expect(page.has_content?("Success")).to be true
      expect(page.has_content?("4588323")).to be true
      expect(page.has_content?("0xbdfeff9a1f4a1bdf483d680046344316019c58cf")).to be true
      expect(page.has_content?("21000")).to be true
    end
  end

  describe " perform search with Mainnet" do
    it "displays the corrent data" do
      visit root_path
      fill_in "search-transaction" , with: "0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250"
      choose "Mainnet"
      click_button "Search"
      current_path.should eq(root_path)
      expect(page.has_content?("0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250")).to be true
      expect(page.has_content?("Success")).to be true
      expect(page.has_content?("6849773")).to be true
      expect(page.has_content?("0xf00d27c64e125aa2da41298edd3660ac077d1e91")).to be true
      expect(page.has_content?("21000")).to be true
    end
  end
end
