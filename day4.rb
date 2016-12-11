class String
  def valid?
    name.checksum == given_checksum
  end

  def given_checksum
    if self =~ /[a-z-]+-\d+\[([a-z]{5})\]/
      $1
    end
  end

  def name
    dash_name.gsub('-','')
  end

  def dash_name
    if self =~ /([a-z-]+)-\d+\[[a-z]{5}\]/
      $1
    end
  end

  def sector_id
    if self =~ /[a-z-]+-(\d+)\[[a-z]{5}\]/
      $1.to_i
    end
  end

  def checksum
    freq = Hash.new(0)
    each_char do |c|
      freq[c] += 1
    end

    freq = freq.to_a.sort do |a, b|
      if a[1] == b[1]
        a[0] <=> b[0]
      else
        b[1] <=> a[1]
      end
    end

    freq[0..4].map { |f| f[0] }.join
  end

  def decrypt
    str = ''
    dash_name.each_char do |s|
      if s == '-'
        str += s
      else
        c = s.ord + sector_id % 26
        c -= 26 if c > 'z'.ord
        str += c.chr
      end
    end
    str
  end
end

part1 = 0
part2 = 0
File.open('day4.txt').each do |line|
  if line.valid?
    part1 += line.sector_id
    part2 = line.sector_id if line.decrypt == 'northpole-object-storage'
  end
end

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"
