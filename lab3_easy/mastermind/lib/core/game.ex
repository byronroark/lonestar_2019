defmodule Mastermind.Core.Game do
  alias Mastermind.Core.Score
  defstruct(
    guesses: [], 
    answer: [1, 2, 3, 4]
  )
  
  def new(answer \\ nil) do
    %__MODULE__{
      answer: random_answer(answer)
    }
  end
  
  defp random_answer(nil) do
    (1..6)
    |> Enum.shuffle
    |> Enum.take(4)
  end
  
  defp random_answer(answer) do
    answer
  end
  
  def move(game, guess) do
  end
  
  def won?(%{ guesses: []}) do
  end
  def won?(game) do
    guess = List.first(game.guesses)
    
    game.answer
    |> Score.new(guess)
    |> Score.winner?
  end
  
  def finished?(game) do
  end
  
  def board(game) do
    game.guesses
    |> Enum.reverse
    |> Enum.map( fn(guess) -> row(game, guess) end )
  end
  
  defp row(game, guess) do
  end
  
  def state(game) do
    %{
      board: nil, 
      finished: nil, 
      nil,
    }
  end
end
