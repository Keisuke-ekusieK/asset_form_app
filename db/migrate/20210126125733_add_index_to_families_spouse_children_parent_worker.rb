class AddIndexToFamiliesSpouseChildrenParentWorker < ActiveRecord::Migration[6.0]
  def change
		add_index :families, [:spouse, :children, :parent, :worker]
  end
end
