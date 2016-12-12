class String
  def abba?
    chars = split('')
    chars.each_with_index do |c, i|
      if chars[i+3] == c && chars[i+1] == chars[i+2] && chars[i+1] != c
        return true
      end
    end
    false
  end

  def aba
    babs = []
    chars = split('')
    chars.each_with_index do |c, i|
      if chars[i+2] == c && chars[i+1] != c
        babs << chars[i+1] + c + chars[i+1]
      end
    end
    babs
  end

  def tls?
    subs = split(/[\[\]]/)
    good = false
    subs.each_with_index do |s, i|
      if s.abba?
        if i.odd?
          return false
        else
          good = true
        end
      end
    end
    good
  end

  def ssl?
    subs = split(/[\[\]]/)
    hyper = []
    babs = []
    subs.each_with_index do |s, i|
      if i.odd?
        hyper << s
      else
        babs += s.aba
      end
    end

    babs = babs.uniq
    hyper.any? { |h| babs.any? { |b| h.match(b) } }
  end
end

tls = 0
ssl = 0
File.open('day7.txt').each do |line|
  tls += 1 if line.tls?
  ssl += 1 if line.ssl?
end

puts("Part 1: #{tls}")
puts("Part 2: #{ssl}")
