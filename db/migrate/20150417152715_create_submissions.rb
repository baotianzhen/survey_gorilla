class CreateSubmissions < ActiveRecord::Migration
  def change
  	create_table :submissions do |t|
  		t.belongs_to :responder
  		t.belongs_to :survey
  	end
  end
end
