class String
  def most_common
    freq = Hash.new(0)
    split('').each do |c|
      freq[c] += 1
    end

    freq.to_a.max { |a,b| a[1] <=> b[1] }.first
  end

  def freq
    freq = Hash.new(0)
    split('').each do |c|
      freq[c] += 1
    end
    freq
  end

  def least_common
    freq.to_a.min { |a,b| a[1] <=> b[1] }.first
  end
end

columns = Hash.new('')
File.open('day6.txt').each do |line|
  line.strip.split('').each_with_index { |c, i| columns[i] += c }
end

part1 = columns.keys.sort.map do |k|
  columns[k].most_common
end.join

part2 = columns.keys.sort.map do |k|
  columns[k].least_common
end.join

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"
