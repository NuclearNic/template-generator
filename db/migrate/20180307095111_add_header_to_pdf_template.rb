class AddHeaderToPdfTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :pdf_templates, :header, :text
  end
end
