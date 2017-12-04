#!/usr/bin/env ruby

# For added security, yet another system policy has been put in place. Now, a valid passphrase must contain no two words that are anagrams of each other - that is, a passphrase is invalid if any word's letters can be rearranged to form any other word in the passphrase.
#
# For example:
#
# abcde fghij is a valid passphrase.
# abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
# a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
# iiii oiii ooii oooi oooo is valid.
# oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
#
# Under this new system policy, how many passphrases are valid?

def word_value(word)
  val = 0
  word.split('').each { |c| val += 2 ** 'abcdefghijklmnopqrstuvwxyz'.index(c) }
  val
end

valid_phrase_count = 0
File.open('input.txt').each do |phrase|
  words_as_numbers = []
  phrase.split(' ').each { |word| words_as_numbers << word_value(word) }
  valid_phrase_count += 1 if words_as_numbers.length == words_as_numbers.uniq.length
end
puts valid_phrase_count
