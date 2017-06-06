class Job < ActiveRecord::Base
  belongs_to :company
  has_many :job_tags
  has_many :tags, through: :job_tags

  validates :title, :level_of_interest, :city, presence: true

  def tag_list
    self.tags.collect do |tag|
      tag.title
    end.zip(get_tag_count).join
  end

  def get_tag_count
    self.tags.collect do |tag|
      JobTag.where(tag_id: tag.id).count 
    end
  end
end
