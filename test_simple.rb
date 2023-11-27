require "minitest/spec"
require "minitest/autorun"

require_relative "./solution.rb"

describe("Who eats who") do
  it("Basic tests") do
    input = "fox,bug,chicken,grass,sheep"
    expected = ["fox,bug,chicken,grass,sheep",
                "chicken eats bug",
                "fox eats chicken",
                "sheep eats grass",
                "fox eats sheep",
                "fox"]

    assert_equal(who_eats_who(input), expected)
  end
end
