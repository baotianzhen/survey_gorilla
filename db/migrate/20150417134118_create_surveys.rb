class CreateSurveys < ActiveRecord::Migration
  def change
  	create_table :surveys do |t|
  		t.belongs_to :author
  		t.string :title
  	end
  end
end
