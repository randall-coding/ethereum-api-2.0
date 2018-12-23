class ChangeThashNameOnTransaction < ActiveRecord::Migration[5.2]
  def change
    rename_column :transactions , :Thash , :txHash
  end
end
