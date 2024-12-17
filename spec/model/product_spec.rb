# validates :name, presence: true
# validates :description, presence: true, length: { maximum: 150 }
# validates :category, presence: true
# validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
# validates :stocklevel, presence: true, numericality: { greater_than_or_equal_to: 0 }
# validates :reorderlevel, presence: true, numericality: { greater_than_or_equal_to: 0 }

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { Product.create(
      name: 'A2 Envelope',
      description: 'Brown, Padded',
      category: 'Paper',
      price:  25.00,
      stocklevel: 50,
      reorderlevel: 25
    ) }
    before { subject.save }

    it "name should be present" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "description should be present" do
      subject.description = nil
      expect(subject).not_to be_valid
    end

    it "description should be less than 150 Characters" do
      subject.description = 'psakmlmlkm nklnkln nklniopnm okml;mkkpo piojopkpokok mp;lkp[ok[kopn;lm;. dsd sadqerty h uiouygfc vbnm kjhg ftyui8765 r4efghjkoiu 6trerty 455645645 y4 5y4 6456 45 645 t 3454 23 sadoasdjasndj asdoijdaad adiodisddas9jdjn adasodsad98asd9832d 23 ewdasdsadasdd d23e3245f wdfsdassa sad 331 dsf asasd sa daddppopkk gkmubtopr as'
      expect(subject).not_to be_valid
    end

    it "category should be present" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

    it "price should be present" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "price should be greater than zero" do
      subject.price = -9.34
      expect(subject).to_not be_valid
    end

    it "stocklevel should be present" do
      subject.stocklevel = nil
      expect(subject).to_not be_valid
    end

    it "stocklevel should be greater than or equal to zero" do
      subject.stocklevel = -9
      expect(subject).to_not be_valid
    end

    it "reorderlevel should be present" do
      subject.reorderlevel = nil
      expect(subject).to_not be_valid
    end

    it "reorderlevel should be greater than zero" do
      subject.reorderlevel = -9
      expect(subject).to_not be_valid
    end
end
    