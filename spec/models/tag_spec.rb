require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        tag = Tag.new(title: 'cool people need not apply')
        expect(tag).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many job_tags" do
      tag = Tag.new(title: 'cool people need not apply')
      expect(tag).to respond_to(:job_tags)
    end

    it "has many jobs through job_tags" do
      tag = Tag.new(title: 'cool people need not apply')
      expect(tag).to respond_to(:jobs)
    end
  end
end
