require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(
      username: 'Kelvin24',
      role: 'supervisor',
      fullname: 'Kelvin Mwale'
    ) }
    before { subject.save }

    it "name should be present" do
      subject.name = nil
      expect(subject).to_not_be_valid   
    end
end
    