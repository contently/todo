class Task < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true

  scope(:not_completed, -> do
    where({:completed => false})
  end)

  scope(:completed, -> do
    where({:completed => true})
  end)
end

