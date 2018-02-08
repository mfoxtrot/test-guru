class ChangeGistnHashColumnName < ActiveRecord::Migration[5.1]
  change_table :gists do |t|
    t.rename :hash, :hash_id
  end
end
