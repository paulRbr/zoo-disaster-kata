require "minitest/spec"
require "minitest/autorun"

require_relative "./solution.rb"

require "base64"
paulrbr_solution = Base64.decode64(<<~RB)
  UEFVTFJCUl9BTklNQUxTX0VBVElORyA9IFsKICAiYW50ZWxvcGUgZWF0cyBncmFzcyIsCiAgImJp
  Zy1maXNoIGVhdHMgbGl0dGxlLWZpc2giLAogICJidWcgZWF0cyBsZWF2ZXMiLAogICJiZWFyIGVh
  dHMgYmlnLWZpc2giLAogICJiZWFyIGVhdHMgYnVnIiwKICAiYmVhciBlYXRzIGNoaWNrZW4iLAog
  ICJiZWFyIGVhdHMgY293IiwKICAiYmVhciBlYXRzIGxlYXZlcyIsCiAgImJlYXIgZWF0cyBzaGVl
  cCIsCiAgImNoaWNrZW4gZWF0cyBidWciLAogICJjb3cgZWF0cyBncmFzcyIsCiAgImZveCBlYXRz
  IGNoaWNrZW4iLAogICJmb3ggZWF0cyBzaGVlcCIsCiAgImdpcmFmZmUgZWF0cyBsZWF2ZXMiLAog
  ICJsaW9uIGVhdHMgYW50ZWxvcGUiLAogICJsaW9uIGVhdHMgY293IiwKICAicGFuZGEgZWF0cyBs
  ZWF2ZXMiLAogICJzaGVlcCBlYXRzIGdyYXNzIgpdCgpkZWYgcGF1bHJicl93aG9fZWF0c193aG8o
  em9vKQogIGFuaW1hbHMgPSB6b28uc3BsaXQoIiwiKQoKICBldmVudHMgPSBTdHJpbmdJTy5uZXcK
  ICBzdXJ2aXZvcnMgPSBwYXVscmJyX2VhdChbXSwgYW5pbWFscywgZXZlbnRzOiBldmVudHMpCgog
  IFt6b29dICsgZXZlbnRzLnN0cmluZy5zcGxpdCgiXG4iKSArIFtzdXJ2aXZvcnMuam9pbigiLCIp
  XQplbmQKCmRlZiBwYXVscmJyX2VhdChzdXJ2aXZvcnMsIGFuaW1hbHMsIGV2ZW50czopCiAgcHJl
  ZGF0b3IgPSBzdXJ2aXZvcnMucG9wCiAgcHJleSA9IGFuaW1hbHMuc2hpZnQKCiAgaWYgcHJleS5u
  aWw/CiAgICBzdXJ2aXZvcnMgKyBbcHJlZGF0b3JdCiAgZWxzaWYgUEFVTFJCUl9BTklNQUxTX0VB
  VElORy5pbmNsdWRlPygiI3twcmVkYXRvcn0gZWF0cyAje3ByZXl9IikKICAgIGV2ZW50cy5wdXRz
  ICIje3ByZWRhdG9yfSBlYXRzICN7cHJleX0iCiAgICBwYXVscmJyX2VhdChzdXJ2aXZvcnMgKyBb
  cHJlZGF0b3JdLCBhbmltYWxzLCBldmVudHM6IGV2ZW50cykKICBlbHNpZiBQQVVMUkJSX0FOSU1B
  TFNfRUFUSU5HLmluY2x1ZGU/KCIje3ByZXl9IGVhdHMgI3twcmVkYXRvcn0iKQogICAgZXZlbnRz
  LnB1dHMgIiN7cHJleX0gZWF0cyAje3ByZWRhdG9yfSIKICAgIHBhdWxyYnJfZWF0KHN1cnZpdm9y
  cywgW3ByZXldICsgYW5pbWFscywgZXZlbnRzOiBldmVudHMpCiAgZWxzZQogICAgcGF1bHJicl9l
  YXQoc3Vydml2b3JzICsgW3ByZWRhdG9yLCBwcmV5XS5jb21wYWN0LCBhbmltYWxzLCBldmVudHM6
  IGV2ZW50cykKICBlbmQKZW5k
RB
eval(paulrbr_solution)

describe("Who eats who") do
  it("eatLeftSingle") do
    input = "chicken,fox,leaves,bug,grass,sheep"
    expected = [
      "chicken,fox,leaves,bug,grass,sheep", 
      "fox eats chicken", 
      "bug eats leaves", 
      "sheep eats grass", 
      "fox,bug,sheep"
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("eatRightSingle") do
    input = "bear,big-fish,lion,cow,bug,leaves"
    expected = [
      "bear,big-fish,lion,cow,bug,leaves", 
      "bear eats big-fish", 
      "lion eats cow", 
      "bug eats leaves", 
      "bear,lion,bug"
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("eatLeftMulti") do
    input = "grass,grass,cow,leaves,bug,big-fish,leaves,bear"
    expected = [
      "grass,grass,cow,leaves,bug,big-fish,leaves,bear", 
      "cow eats grass",
      "cow eats grass",
      "bug eats leaves", 
      "bear eats leaves", 
      "bear eats big-fish", 
      "bear eats bug",
      "bear eats cow", 
      "bear"
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("eatRightMulti") do
    input = "giraffe,leaves,leaves,leaves,bear,bug,leaves,leaves,panda"
    expected = [
      "giraffe,leaves,leaves,leaves,bear,bug,leaves,leaves,panda", 
      "giraffe eats leaves",
      "giraffe eats leaves",
      "giraffe eats leaves",
      "bear eats bug", 
      "bear eats leaves", 
      "bear eats leaves", 
      "giraffe,bear,panda"
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("eatLeftAndRightMulti") do
    input = "bear,grass,grass,grass,grass,sheep,bug,chicken,little-fish,little-fish,little-fish,little-fish,big-fish,big-fish,big-fish"
    expected = [
      "bear,grass,grass,grass,grass,sheep,bug,chicken,little-fish,little-fish,little-fish,little-fish,big-fish,big-fish,big-fish", 
      "sheep eats grass",
      "sheep eats grass",
      "sheep eats grass",
      "sheep eats grass",
      "bear eats sheep",
      "bear eats bug",
      "bear eats chicken",
      "big-fish eats little-fish",
      "big-fish eats little-fish",
      "big-fish eats little-fish",
      "big-fish eats little-fish",
      "bear eats big-fish",
      "bear eats big-fish",
      "bear eats big-fish",
      "bear"
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("nobodyEatsAnything") do
    input = "fox,grass,chicken,lion,panda"
    expected = [
      "fox,grass,chicken,lion,panda", 
      "fox,grass,chicken,lion,panda"
    ]
    assert_equal(who_eats_who(input), expected)
  end
  
  it("emptyZoo") do
    input = ""
    expected = [
      "",
      ""
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("singleKnownThing") do
    input = "bug"
    expected = [
      "bug", 
      "bug"
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("singleUnknownThing") do
    input = "wtf"
    expected = [
      "wtf", 
      "wtf"
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("knownAndUnknownThings") do
    input = "fox,chicken,tree,chicken,bug,banana,bug,bear"
    expected = [
      "fox,chicken,tree,chicken,bug,banana,bug,bear", 
      "fox eats chicken",
      "chicken eats bug",
      "bear eats bug",
      "fox,tree,chicken,banana,bear"
    ]
    assert_equal(who_eats_who(input), expected)
  end

  it("random") do
    things = ["busker", "banana", "bicycle", "antelope", "big-fish", "bug", "bear", "chicken", "cow", "fox", "giraffe", "grass", "leaves", "lion", "little-fish", "panda", "sheep"]
    500.times.each do |r|
      nzoo = (rand * 15).floor
      azoo = []

      nzoo.times.each do |z|
        i = (rand * things.size).floor
        azoo << things[i]
      end
      input = azoo.join(",")
      puts("Random Test #{r+1}: ZOO = #{input}")
      expected = paulrbr_who_eats_who(input)
      assert_equal(who_eats_who(input), expected)
    end
  end
end
