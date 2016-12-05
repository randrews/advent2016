@triangles = File.open('day3.txt').map do |line|
  if line.strip =~ /(\d+)\s*(\d+)\s*(\d+)/
    [$1, $2, $3].map(&:to_i)
  else
    nil
  end
end

def valid(triangles)
  triangles.select do |t|
    tri = t.sort
    tri[0] + tri[1] > tri[2]
  end
end

def to_vert(triangles)
  triples = []
  i = 0
  while triangles[i]
    (0..2).each do |n|
      triples << [triangles[i][n], triangles[i+1][n], triangles[i+2][n]]
    end
    i += 3
  end
  triples
end

puts("Part 1: " + valid(@triangles).count.to_s)
puts("Part 2: " + valid(to_vert(@triangles)).count.to_s)
