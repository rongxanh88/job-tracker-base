require 'rails_helper'

RSpec.feature 'Tag', type: :feature do
  before(:each) do
    @company = Company.create!(name: 'Fox News')
    @job = @company.jobs.create!(
      title: 'Water Filler', description: 'Lives Dangerously',
      level_of_interest: 90, city: 'Denver'
      )
    @tag = @job.tags.create!(title: 'cool job for juniors')
    @different_tag = Tag.create!(title: 'unrelated')
  end

  describe 'is attached to job' do
    it "is seen with job" do
      visit(company_job_path(@company, @job))

      expect(page).to have_content(@job.title)
      expect(page).to have_content(@tag.title)
      expect(page).not_to have_content(@different_tag.title)
    end

    it 'multiple tags are seen with job' do
      skip
      another_tag = @job.tags.create!(title: 'ask about this job')

      visit(company_job_path(@company, @job))

      expect(page).to have_content(@job.title)
      expect(page).to have_content(@tag.title)
      expect(page).to have_content(another_tag.title)
      expect(page).not_to have_content(@different_tag.title)
    end
  end
end
