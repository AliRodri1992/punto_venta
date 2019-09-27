require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
  end

  it 'is valid' do
    company = create(:company)
    expect(company).to be_valid
  end
end
