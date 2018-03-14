# create array with English alphabet
alphabet = ('a'..'z').to_a
hh = {}

alphabet.each_with_index do |l, i|
  i += 1
  hh[l] = i if l == 'a'
  hh[l] = i if l == 'e'
  hh[l] = i if l == 'i'
  hh[l] = i if l == 'o'
  hh[l] = i if l == 'u'
  hh[l] = i if l == 'y'
end

p hh