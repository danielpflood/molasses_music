class FixColumnNameType < ActiveRecord::Migration
  def self.up
    rename_column :projects, :type, :project_type
  end

  def self.down
    rename_column :projects, :projects_type, :type
  end
end
