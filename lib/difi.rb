require "difi/version"

module Difi
  require 'json'
  require 'faraday'
  require 'excon'

  def url
    @@url ||= "http://hotell.difi.no/api/json/"
  end

  def conn
    @@conn ||= Faraday.new(:url => 'http://sushi.com') do |faraday|
      faraday.request   :url_encoded            # form-encode POST params
      faraday.response  :logger                 # log requests to STDOUT
      faraday.adapter   :excon                  # make requests with Excon
    end
  end

  def dataset
    self.to_s.downcase.sub("::", "/")
  end

  def get(query)
    @@response = conn.get("#{url}/#{dataset}#{query}")
  end

  def fields
    get "/fields"
    json
  end

  def fetch(fields)
    get "?" + URI.escape(fields.collect{|k,v| "#{k}=#{v}"}.join('&'))
    json
  end

  def response
    @@response
  end

  def json
    JSON.parse @@response.body
  end
end
