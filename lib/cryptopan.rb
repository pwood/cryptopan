require 'netaddr'

class CryptoPAn
  def initialize(key)
    if key.is_a? Array
      material = key.pack("c*")
    else
      material = key
    end

    raise "Key material is not 32 bytes." if material.length != 32

    @key = material[0..15]
    unencrypted_pad = material[16..31]

    @pad = encrypt(unencrypted_pad)
  end

  def anonymise(ip)
    long_ip = NetAddr.ip_to_i ip

    encrypt_input = @pad

    long_pad = @pad[0].to_i << 24
    long_pad += @pad[1].to_i << 16
    long_pad += @pad[2].to_i << 8
    long_pad += @pad[3].to_i

    result = 0

    32.times do |i|
      first4bytes_input = long_pad

      if i > 0
        first4bytes_input = (long_ip >> (32-i)) << (32-i) | ((long_pad << i) & 0xffffffff) >> i
      end

      encrypt_input[0] = first4bytes_input >> 24
      encrypt_input[1] = (first4bytes_input << 8) >> 24
      encrypt_input[2] = (first4bytes_input << 16) >> 24
      encrypt_input[3] = (first4bytes_input << 24) >> 24

      encrypt_output = encrypt(encrypt_input.pack("c*"))[0]

      result |= (((encrypt_output & 0xff) >> 7) << (31-i))
    end

    value = result ^ long_ip

    output_value = []
    output_value[0] = value >> 24 & 0xff
    output_value[1] = value >> 16 & 0xff
    output_value[2] = value >> 8 & 0xff
    output_value[3] = value & 0xff

    output_value.join(".")
  end

  private

  def encrypt(value)
    cipher = OpenSSL::Cipher.new('AES-128-ECB')
    cipher.padding = 0
    cipher.encrypt

    cipher.key = @key

    (cipher.update(value) + cipher.final).bytes
  end
end
