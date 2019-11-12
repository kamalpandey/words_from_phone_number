# frozen_string_literal: true

require_relative '../lib/words_from_phone_number/conversion.rb'
describe Conversion do
  let(:phone1) { '6686787825' }

  let(:result1) do
    [%w[noun struck],
     %w[onto struck],
     %w[motor truck],
     %w[motor usual],
     %w[nouns truck],
     %w[nouns usual],
     ['motortruck']]
  end

  let(:phone2) { '2282668687' }

  let(:result2) do
    [%w[act amounts],
     %w[act contour],
     %w[bat amounts],
     %w[bat contour],
     %w[cat amounts],
     %w[cat contour],
     %w[acta mounts],
     'catamounts']
  end

  let(:invalid_phone) { '9841664607' }

  context '#validate number' do
    it 'return true for valid number' do
      object = Conversion.new(phone1)
      expect(object.valid_phone_number?).to be(true)
    end

    it 'return false for invalid number' do
      object = Conversion.new(invalid_phone)
      expect(object.valid_phone_number?).to be(false)
    end

    it 'returns error message when invalid number is given' do
      object = Conversion.new(invalid_phone)
      expect(object.generate_words).to eq('Invalid Phone number.')
    end
  end

  context '#generate_words' do
    it 'return multiple words combination for valid numbers' do
      object = Conversion.new(phone2)
      expect(object.generate_words).to match_array(result2)
    end
  end
end
