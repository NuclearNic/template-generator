class AddFooterToPdfTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :pdf_templates, :footer, :text
  end
end
