@buttons = {
  1 => {u: 1, d: 4, r: 2, l: 1},
  2 => {u: 2, d: 5, r: 3, l: 1},
  3 => {u: 3, d: 6, r: 3, l: 2},
  4 => {u: 1, d: 7, r: 5, l: 4},
  5 => {u: 2, d: 8, r: 6, l: 4},
  6 => {u: 3, d: 9, r: 6, l: 5},
  7 => {u: 4, d: 7, r: 8, l: 7},
  8 => {u: 5, d: 8, r: 9, l: 7},
  9 => {u: 6, d: 9, r: 9, l: 8}
}

@buttons2 = {
  1 => {d: 3},
  2 => {d: 6, r: 3},
  3 => {u: 1, d: 7, l: 2, r: 4},
  4 => {l: 3, d: 8},
  5 => {r: 6},
  6 => {u: 2, d: 'A', l: 5, r: 7},
  7 => {u: 3, d: 'B', l: 6, r: 8},
  8 => {u: 4, d: 'C', l: 7, r: 9},
  9 => {l: 8},
  'A' => {u: 6, r: 'B'},
  'B' => {u: 7, d: 'D', l: 'A', r: 'C'},
  'C' => {u: 8, l: 'B'},
  'D' => {u: 'B'}
}

def parse_line(buttons, line, key)
  line.strip.split('').each do |ch|
    key = buttons[key][ch.downcase.to_sym] || key
  end
  key
end

key1 = 5
key2 = 5
code1 = []
code2 = []

File.open('day2.txt').each do |line|
  key1 = parse_line(@buttons, line, key1)
  code1 << key1

  key2 = parse_line(@buttons2, line, key2)
  code2 << key2
end

puts "Part 1: #{code1.join('')}"
puts "Part 2: #{code2.join('')}"
