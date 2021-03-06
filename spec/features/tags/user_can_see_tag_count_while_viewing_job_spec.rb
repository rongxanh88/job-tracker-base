require 'rails_helper'

RSpec.feature 'Tag', type: :feature do
  describe 'is attached to multiple jobs' do
    it 'shows count of jobs with that tag' do
      company = Company.create(name: 'Fox News')
      job = company.jobs.create!(
        title: 'Water Filler', description: 'Lives Dangerously',
        level_of_interest: 90, city: 'Denver'
        )
      job2 = company.jobs.create!(
        title: 'Water Drinker', description: 'Must Drink 10 gallons per day',
        level_of_interest: 10, city: 'Denver'
      )
      tag = Tag.create!(title: 'cool job dude')
      job.tags.append(tag)
      job2.tags.append(tag)

      visit(company_job_path(company, job))

      expect(page).to have_content("#{tag.title} 2")
    end
  end
end