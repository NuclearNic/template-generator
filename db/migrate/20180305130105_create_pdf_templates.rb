class CreatePdfTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :pdf_templates do |t|
      t.string :title

      t.timestamps
    end
  end
end
