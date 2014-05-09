require "pathname"
require 'json'

# usage:
# Jsonify.parse_feature_file 'features-a.txt'
# Used as a singleton to parse and process text files into json
# use feature-a.txt for testing
# returns:
#[
# {"feature":"TXT MESSAGING - 250","date_range":"09/29 - 10/28","price":"4.99"},
# {"feature":"TEST SHORT DATE - 500","date_range":"9/1 - 1/31","price":"7.00"},
# {"feature":"TEST USE NUMBER AT END - 500","date_range":"09/1 - 01/31","price":"6.00"},
# {"feature":"TEST SHORT NUMBER NO DOLLAR- 250","date_range":"09/29 - 10/28","price":"3"},
# {"feature":"TEST LONG NUMBER NO END - 1000","date_range":"09/29 - 10/28","price":"1111112.15"},
# {"feature":"TEST NO END NUMBER - 3","date_range":"09/29 - 10/28","price":"11.61"},
# {"feature":"TEST NO LEADING - 0","date_range":"09/29 - 10/28","price":".13"},
# {"feature":"TEST ZERO LEADING NO MOD ","date_range":"09/29 - 10/28","price":".4"},
# {"feature":"TEST NO MODIFIER ","date_range":"09/29 - 10/28","price":"0.7"}
# ]


module Jsonify
  extend self

  #generic file reader with rescue.class
  #requires a block
  def parse_from_file(file_name)
    begin
      raise 'block required for parse_features_from' unless block_given?
      feature_file = Pathname.new file_name
      feature_file.open.each do |line|
        yield line
      end
    rescue => e
      print "Parsing #{feature_file}\n"
      puts e.to_s
    end
  end

  #specific format parser

MATCH_FEATURE =
    /\$?                              # dollar sign optional
  (?<first_price>[0-9]{0,}([\,\.][0-9]+)?)        # decimal or integer price
  \s*
  (?<name>[A-Z\s]*)                 # upper case string
  (?<name_modifier>-\s?[\dA-Z]*)?   # requires '-' followed by upper case modifier string or integer
  \s*
  (?<start_date>\d{1,2}\/\d{1,2})   # one or two digit day, slash required, one or two digit month
  [-\s]*
  (?<end_date>\d{1,2}\/\d{1,2})
  \s*
  (?<optional_price>[0-9]{0,}([\,\.][0-9]+)?)
  /x

  def feature_to_hash(line)
    m = line.match MATCH_FEATURE
    return unless m
    if m['optional_price'].empty?
      price = m['first_price']
    else
      price = m['optional_price']
    end
    name = m['name']
    name += m['name_modifier'] if m['name_modifier']
    date = "#{m['start_date']} - #{m['end_date']}"
    {
        feature: name,
        date_range: date,
        price: price
    }
  end

  def features_to_json(file_name)
    features=[]
    parse_from_file(file_name) do |line|
      feature = feature_to_hash(line)
      features << feature if feature
    end
    features.to_json
  end
end

# usage:
puts Jsonify.features_to_json 'features-a.txt'

