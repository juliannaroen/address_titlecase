require 'spec_helper'


describe AddressTitlecase::Titleizer do  
  describe '.titleize' do
    subject(:titleize) { described_class.titleize(input_address, overrides) }

    context 'without overrides' do
      let(:titleized_address) { "123 Sesame St SE\nSalem, OR 97301" }
      let(:overrides) { {} }

      context 'with a downcased address' do
        let(:input_address) { "123 sesame st se\nsalem, or 97301" }

        it { is_expected.to eq(titleized_address) }
      end

      context 'with a upcased address' do
        let(:input_address) { "123 SESAME ST SE\nSALEM, OR 97301" }

        it { is_expected.to eq(titleized_address) }
      end

      context 'with a inproper titlecased address' do
        let(:input_address) { "123 Sesame St Se\nSalem, Or 97301" }

        it { is_expected.to eq(titleized_address) }
      end
    end

    context 'with overrides' do
      let(:overrides) { { 'Se' => 'Se', 'St' => 'ST' } }
      let(:input_address) { "123 Sesame St Se\nSalem, Or 97301" }
      let(:titleized_address) { "123 Sesame ST Se\nSalem, OR 97301" }

      it { is_expected.to eq(titleized_address) }
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