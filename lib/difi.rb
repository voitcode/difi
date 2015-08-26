require "difi/version"

# General methods for working with the public APIs at http://hotell.difi.no
#
# This module is meant to extend a Difi registry class.
#
# For instance the Brreg::Enhetsregisteret class
module Difi
  require 'json'
  require 'faraday'
  require 'excon'
  require 'brreg'

  # The API source URL
  def url
    @@url ||= "http://hotell.difi.no/api/json/"
  end

  # The API connection
  def conn
    @@conn ||= Faraday.new(:url => url) do |faraday|
      faraday.request   :url_encoded            # form-encode POST params
      faraday.response  :logger                 # log requests to STDOUT
      faraday.adapter   :excon                  # make requests with Excon
    end
  end

  # The current dataset
  def dataset
    self.to_s.downcase.sub("::", "/")
  end

  # Perform a GET HTTP query on the current dataset
  def get(query)
    @@response = conn.get("#{url}/#{dataset}#{query}")
  end

  # Return the fields of the current dataset
  def fields
    get "/fields"
    json
  end

  # Search for entries from the current dataset with the given fields
  # Input is expected to be a Hash
  def search(fields)
    get "?" + URI.escape(fields.collect{|k,v| "#{k}=#{v}"}.join('&'))
    json
  end

  # Return the last HTTP response
  def response
    @@response
  end

  # Return the last HTTP response body as JSON
  def json
    JSON.parse @@response.body
  end
end
