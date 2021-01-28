class ChangeUsersFirstnameAndLastnameToCompanyName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :first_name, :company_name
    remove_column :users, :last_name
  end
end
