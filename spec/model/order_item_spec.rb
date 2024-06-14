# validates :quantity, presence: true

    require 'rails_helper'

    RSpec.describe OrderItem, type: :model do

      test_envelope = Product.create(
      name: 'A2 Envelope',
      description: 'Brown, Padded',
      category: 'Paper',
      price:  25.00,
      stocklevel: 50,
      reorderlevel: 25
    )
      subject { OrderItem.create(
          order_id: Order.create(
            user_id: User.create(
              username: 'Kelvin24',
              role: 'supervisor',
              fullname: 'Kelvin Mwale'
            ).id,
            date: '24-05-2024',
            total: 9.99
          ).id,
          product_id: test_envelope.id,
          quantity: 10
        ) }
        before { subject.save }
    
        it "quantity should be present" do
          subject.quantity = nil
          expect(subject).to_not be_valid
        end

        it "should assign the price to be the product price" do
          subject.set_price
          expect(subject.price).to eq(test_envelope.price)
        end

    end