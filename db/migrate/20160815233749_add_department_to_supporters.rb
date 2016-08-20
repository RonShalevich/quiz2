class AddDepartmentToSupporters < ActiveRecord::Migration[5.0]
  def change
    add_column :supporters, :dept, :string
  end
end
