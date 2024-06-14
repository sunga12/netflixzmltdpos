require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(
      username: 'Kelvin24',
      role: 'supervisor',
      fullname: 'Kelvin Mwale'
    ) }
    before { subject.save }

    it "username should be present" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "role should be present" do
      subject.role = nil
      expect(subject).not_to be_valid
    end

    it "fullname should be present" do
      subject.fullname = nil
      expect(subject).to_not be_valid
    end
end
    