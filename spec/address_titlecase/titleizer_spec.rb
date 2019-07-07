require 'spec_helper'


describe AddressTitlecase::Titleizer do  
  describe '.titleize' do
    subject(:titleize) { described_class.titleize(address, {}) }
    let(:properly_titleized_address) { "123 Sesame St SE\n Salem, OR 97301" }

    context 'with a downcased address' do
      let(:address) { "123 sesame st se\n salem, or 97301" }

      it { is_expected.to eq(properly_titleized_address) }
    end

    context 'with a upcased address' do
      let(:address) { "123 SESAME ST SE\n SALEM, OR 97301" }

      it { is_expected.to eq(properly_titleized_address) }
    end

    context 'with a inproper titlecased address' do
      let(:address) { "123 Sesame St Se\n Salem, Or 97301" }

      it { is_expected.to eq(properly_titleized_address) }
    end
  end
end

describe String do
  describe '.address_titlecase' do
    subject(:address_titlecase) { address.address_titlecase }
    let(:address) { '123 Sesame St' }

    it 'calls AddressTitlecase::Titleizer.titleize on the String class' do
      expect(AddressTitlecase::Titleizer).to receive(:titleize).with(described_class, {})
      address_titlecase
    end
  end

  describe '.address_titleize' do
    subject(:address_titleize) { address.address_titleize }
    let(:address) { '123 Sesame St' }

    it 'calls AddressTitlecase::Titleizer.titleize on the String class' do
      expect(AddressTitlecase::Titleizer).to receive(:titleize).with(described_class, {})
      address_titleize
    end
  end
end