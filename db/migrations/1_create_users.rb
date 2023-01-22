Sequel.migration do
  up do
    create_table(:users) do
      String :id, primary_key: true
    end
  end

  down do
    drop_table(:users)
  end
end
