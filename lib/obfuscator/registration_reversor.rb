module Obfuscator
  module RegistrationReversor
    def self.obfuscate(registration, stock_reference)
      registration_reversed = registration.reverse

      [].tap do |el|
        registration.length.times do |idx|
          el << stock_reference[idx] << registration_reversed[idx]
        end
      end.join("") + stock_reference[8]
    end
  end
end
