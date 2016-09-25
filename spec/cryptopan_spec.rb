require 'spec_helper'
require 'test_data'

describe CryptoPAn do
  it 'raises an error if key length is not 32 bytes' do
    expect{CryptoPAn.new('')}.to raise_error("Key material is not 32 bytes.")
  end

  IPV4_TEST_DATA.each do |test|
    it "obsfucates #{test[0]} to #{test[1]}" do
      cryptopan = CryptoPAn.new(test[2])
      actualOutput = cryptopan.anonymise(test[0])

      expect(actualOutput).to eq(test[1])
    end
  end
end
