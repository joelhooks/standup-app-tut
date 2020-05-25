require 'rails_helper'

RSpec.describe Account, type: :model do
  context "valid factory" do
    it "has a vali1d factory" do
      expect(FactoryBot.build(:account)).to be_valid
    end
  end

  context "valid validations" do
    it "will not save without a name" do
      expect(FactoryBot.build(:account, name: nil).save).to be_falsey
    end
  end

end
