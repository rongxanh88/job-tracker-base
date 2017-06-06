class Job < ActiveRecord::Base
  belongs_to :company
  has_many :job_tags
  has_many :tags, through: :job_tags

  validates :title, :level_of_interest, :city, presence: true

  def tag_list
    # binding.pry
    self.tags
  end
end
