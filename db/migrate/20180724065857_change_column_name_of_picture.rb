class ChangeColumnNameOfPicture < ActiveRecord::Migration[5.2]
  def change
  	rename_column :pictures, :image, :avatar
  end
end
