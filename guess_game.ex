defmodule GuessGame do
  def guess(a, b) when a > b, do: guess(b, a)
  def guess(a, b) when a == b, do: "You're thinking of #{a}!"
  def guess(low, high) do
    answer = IO.gets("You're thinking of #{mid(low, high)}?\n")

    case String.trim(answer) do
      "bigger" -> bigger(low, high)
      "smaller" -> smaller(low, high)
      "yes" -> IO.puts("I knew I could do it!")
      _ -> 
        IO.puts ~s(Type "bigger", "smaller" or "yes")
        guess(low, high)
    end
  end

  def mid(low, high) do
    low + div(high - low, 2)
  end

  def smaller(low, high) do
    guess(low, mid(low, high))
  end

  def bigger(low, high) do
    guess(mid(low, high) + 1, high)
  end
end

# [low, high] = System.argv
IO.puts "Think of a number between 1 and 100 and I will try to guess it"
Process.sleep(5 * 1000)
GuessGame.guess(1, 100)

