class AddValueToResults < ActiveRecord::Migration

  def change
    add_column :results, :value, :string
  end

end
