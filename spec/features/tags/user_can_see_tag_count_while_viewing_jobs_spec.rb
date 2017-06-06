require 'rails_helper'

RSpec.feature 'Tag', type: :feature do
  before(:each) do
    # @company = Company.create(name: 'Fox')
    # @job = @company.jobs.create!(
    #   title: 'Water Filler', description: 'Lives Dangerously',
    #   level_of_interest: 90, city: 'Denver'
    #   )
    # @tag = Tag.create!(title: 'cool job')
    # @different_tag = Tag.create!(title: 'unrelated')
  end

  describe 'is attached to job' do
    it "is seen with job" do
      skip
      visit(company_job_path(@company, @job))

      expect(page).to have_content(@job.title)
      expect(page).to have_content(@tag.title)
      expect(page).not_to have_content(@different_tag.title)
    end

    it 'multiple tags are seen with job' do
      skip
      another_tag = Tag.create!(title: 'ask about this job')

      visit(company_job_path(@company, @job))

      expect(page).to have_content(@job.title)
      expect(page).to have_content(@tag.title)
      expect(page).to have_content(another_tag.title)
      expect(page).not_to have_content(@different_tag.title)
    end
  end
end
