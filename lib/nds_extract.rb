require 'pp'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
 # pp source
  director_list = []
  row_index = 0
  
    while row_index < source.length do
      director_list.push(source[row_index][:name])
      row_index += 1
    end
  
  director_list
end

def total_gross(source)
 #pp source
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  dir_earnings_hash = directors_totals(source)
  list_dir_array = list_of_directors(source)
  grand_total = 0
  row_index = 0
  
  while row_index < list_dir_array.length do
    individual_dir = list_dir_array[row_index]
    grand_total += dir_earnings_hash.fetch(individual_dir)
    row_index += 1
  end
  
  grand_total
end

=begin

### WHATS ACTUALLY HAPPENING ###

def total_gross(source)
  grand_total = 0
  row_index = 0
  
  while row_index < list_of_directors(source).length do
    grand_total += directors_totals(source)[list_of_directors(source)[row_index]]
    row_index += 1
  end
  
  grand_total
end

=end