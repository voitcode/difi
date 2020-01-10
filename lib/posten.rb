require 'csv'

# Norwegian zip codes
class Posten
  extend Difi

  # The URL to the geo-tagged zip code database by Erik Bolstad
  def self.url
    @@url = "http://www.erikbolstad.no/postnummer-koordinatar/txt/postnummer.csv"
  end

  # Get the zip code database
  def self.get
    conn.get url
  end

  def self.response
    @@response ||= get
  end

  # Return zip codes for the given counties
  def self.zipcodes(*county)
    @@result = parse.collect {|l| l if county.include?(l[8]) }.compact
  end

  def self.data
    @@data ||= response.body
  end

  def self.lines
    @@lines ||= data.gsub(/\t/, ',').split("\n")
  end

  def self.parse
    @@all_lines ||= lines.collect {|l| CSV.parse(l) }
  end
end
