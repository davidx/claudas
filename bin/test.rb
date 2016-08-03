def test1
  p  "test1"
  return true
end
def test2
  p  "test2"
  return true
end
def test3
  p  "test3"
  return true
end
def test4
  p  "test4"
  return true
end
def test5
  p  "test5"
  return false
end



if test1 && test2 && test3 && test4 && test5
  p "all good"
end