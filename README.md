# Difi

The Norwegian government has started publishing a lot of data through a central API.
Information can be found at http://data.norge.no/

This gem makes use of the public APIs to provide easy access to public data.

Such as the Business Registry.

As a bonus, the Difi gem provides Zip codes as maintained by Erik Bolstad:
http://www.erikbolstad.no/geo/noreg/postnummer/

## Installation

Add this line to your application's Gemfile:

    gem 'difi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install difi

## Usage

Example: search the Norwegian Business Registry for a given Business (Voit AS):

    Brreg::Enhetsregisteret.search query: "Voit AS"
    => {"entries"=>
      [{"nkode2"=>"",
        "nkode1"=>"62.020",
        "tlf_mobil"=>"",
        "organisasjonsform"=>"AS",
        "ppoststed"=>"",
        "tvangsavvikling"=>"N",
        "forretningsadr"=>"Lyngveien 5",
        "regifriv"=>"N",
        "orgnr"=>"811754862",
        "forradrland"=>"Norge",
        "stiftelsesdato"=>"25.02.2013",
        "forradrkommnr"=>"1805",
        "konkurs"=>"N",
        "regdato"=>"30.03.2013",
        "avvikling"=>"N",
        "regifr"=>"J",
        "forradrpoststed"=>"NARVIK",
        "ppostland"=>"",
        "forradrkommnavn"=>"NARVIK",
        "forradrpostnr"=>"8514",
        "navn"=>"VOIT AS",
        "regnskap"=>"",
        "url"=>"",
        "sektorkode"=>"2100",
        "regimva"=>"J",
        "ppostnr"=>"",
        "postadresse"=>"",
        "nkode3"=>"",
        "regiaa"=>"J",
        "tlf"=>""}],
     "page"=>1,
     "pages"=>1,
     "posts"=>1}

The result is a Hash with the complete public information about the business.
This is collected from the public JSON API at http://hotell.difi.no/

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

I would love some help on extending the API support.
