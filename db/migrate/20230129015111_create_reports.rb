class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :memo

      t.timestamps
    end
  end

  def change
    add_column :reports, :user_id, :integer
  end

end
