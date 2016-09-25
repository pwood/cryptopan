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

  it "does not currupt internal state such after use" do
    key = SecureRandom.random_bytes(32).bytes

    ip = "8.8.8.8"

    cryptopan = CryptoPAn.new(key)
    first = cryptopan.anonymise(ip)
    second = cryptopan.anonymise(ip)

    expect(first).to eq(second)
  end
end
