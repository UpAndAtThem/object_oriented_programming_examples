def generateHashtag(str)
  if str.empty? or str.length > 139
    return false
  end

  "#" + str.gsub(/\s+/, ' ').split(" ").map(&:capitalize).join
end

p generateHashtag "hello    world    you          cool               Cat"