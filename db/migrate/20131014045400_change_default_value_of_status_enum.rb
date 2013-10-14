class ChangeDefaultValueOfStatusEnum < ActiveRecord::Migration
  def change
    change_column_default :posts, :status_enum, 1
  end
  
  Post.where(status_enum: 0).each do |p|
    p.update(status_enum: 1)
  end
end
