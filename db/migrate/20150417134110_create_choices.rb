class CreateChoices < ActiveRecord::Migration
  def change
  	create_table :choices do |t|
  		t.string :body
  		t.belongs_to :question
  	end
  end
end
