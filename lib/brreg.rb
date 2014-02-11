# Brreg datasets
module Brreg
  class Registry
    extend Difi
  end

  # The public Norwegian business registry dataset
  class Enhetsregisteret < Registry
  end

  # The public Norwegian business registry dataset - sub units
  class Underenheter < Registry
  end
end
