# frozen_string_literal: true

require 'spec_helper'

describe AddressTitlecase::Titleizer do
  describe '.titleize' do
    subject(:titleize) { described_class.titleize(input_address, overrides: overrides) }

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
  describe '#address_titlecase' do
    let(:address) { '123 sesame st' }

    context 'without overrides' do
      subject(:address_titlecase) { address.address_titlecase }

      it 'calls AddressTitlecase::Titleizer.titleize on the String class' do
        expect(AddressTitlecase::Titleizer).to receive(:titleize).with(described_class, {})
        address_titlecase
      end
    end

    context 'with overrides' do
      subject(:address_titlecase) { address.address_titlecase(overrides: { 'Se' => 'SE' }) }

      it 'calls AddressTitlecase::Titleizer.titleize on the String class with overrides' do
        expect(AddressTitlecase::Titleizer).to receive(:titleize).with(described_class, overrides: { 'Se' => 'SE' })
        address_titlecase
      end
    end
  end

  describe '#address_titleize' do
    it 'is aliased to .address_titlecase' do
      expect(described_class.instance_method(:address_titlecase)).to eq(described_class.instance_method(:address_titleize))
    end
  end
end
