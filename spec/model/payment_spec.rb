# validates :paymentmethod, presence: true

require 'rails_helper'

RSpec.describe Payment, type: :model do

  test_order = Order.create(
    user_id: User.create(
      username: 'Kelvin24',
      role: 'supervisor',
      fullname: 'Kelvin Mwale'
    ),
    total: 9.99,
    date: '24-03-2023'
  )

  subject { Payment.create(
      order_id: test_order.id
      )
   }
    before { subject.save }

    it "payment method should be the default: cash" do
      expect(subject.paymentmethod).to eq('cash')
    end

    it "payment method should be momo" do
      subject.paymentmethod = 'momo'
      expect(subject.paymentmethod).to eq('momo')
    end

end