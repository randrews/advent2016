require 'digest'

part1_password = ''
seed = 'abbhdwsy'
n = 0

while part1_password.length < 8
  md5 = Digest::MD5.hexdigest(seed + n.to_s)
  if md5 =~ /^00000(.)/
    part1_password += $1
  end
  n += 1
end

puts "Part 1: #{part1_password}"

n = 0
part2_password = {}
while part2_password.length < 8
  md5 = Digest::MD5.hexdigest(seed + n.to_s)
  if md5 =~ /^00000([0-7])(.)/
    unless part2_password[$1.to_i]
      part2_password[$1.to_i] = $2
    end
  end
  n += 1
end

part2 = (0..7).map { |i| part2_password[i] }.join
puts "Part 2: #{part2}"
