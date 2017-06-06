require 'rails_helper'

RSpec.describe JobTag, type: :model do
  describe "relationships" do
    it "belongs to job" do
      job_tag = JobTag.new
      expect(job_tag).to respond_to(:job)
    end

    it "belongs to tag" do
      job_tag = JobTag.new
      expect(job_tag).to respond_to(:tag)
    end
  end
end
