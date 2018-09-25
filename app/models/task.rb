class Task < ActiveRecord::Base
  validates :name, presence: true

  scope(:not_completed, -> do
    where({:completed => false})
  end)

  scope(:completed, -> do
    where({:completed => true})
  end)
end

