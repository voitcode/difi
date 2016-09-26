# Brreg datasets
module Brreg
  class Registry
    extend Difi

    def self.dataset
      "brreg/enhetsregisteret"
    end
  end

  # The public Norwegian business registry dataset
  class Enhetsregisteret < Registry
  end

  # The public Norwegian business registry dataset - sub units
  class Underenheter < Registry
    def self.dataset
      "brreg/underenheter"
    end
  end
end
