class AddAcceptedToReports < ActiveRecord::Migration
  def change
    add_column :reports, :accepted_by_project_owner, :boolean, default: false
  end
end
