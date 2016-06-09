class AddCommentToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :comment, :text
  end
end
