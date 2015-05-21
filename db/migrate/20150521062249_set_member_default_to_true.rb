class SetMemberDefaultToTrue < ActiveRecord::Migration
  def change
  	change_column_default :users, :member, true
  end
end
