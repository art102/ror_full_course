# create array with English alphabet
alphabet = ('a'..'z').to_a
vowels_numbers = {}

# Create array with vowels
vowels = %w(a e i o u y)

alphabet.each.with_index(1) do |letter, index|
  # Add vowel if find it
  vowels_numbers[letter] = index if vowels.include?(letter)
end

p vowels_numbers
