class AddDescriptionToPdfTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :pdf_templates, :description, :string
  end
end
