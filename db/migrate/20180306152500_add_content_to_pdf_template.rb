class AddContentToPdfTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :pdf_templates, :content, :text
  end
end
