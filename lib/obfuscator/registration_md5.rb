module Obfuscator
  module RegistrationMd5
    def self.obfuscate(registration, stock_reference)
      Digest::MD5.hexdigest("#{registration}#{stock_reference}")
    end
  end
end
