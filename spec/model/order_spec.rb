#   validates :total, numericality: { greater_than_or_equal_to: 0 }

require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.create(
      user_id: User.create(
        username: 'Kelvin24',
        role: 'supervisor',
        fullname: 'Kelvin Mwale'
      ).id,
      date: '24-05-2024',
      total: 9.99
    ) }
    before { subject.save }

    it "total should be greater than 0" do
      subject.total = -9.99
      expect(subject).to_not be_valid
    end
end
    