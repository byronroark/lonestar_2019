defmodule Mastermind.Boundary.GameServer do
	  use GenServer
	  alias Mastermind.Core.Game
	
	  # Client
	
    def start_link(answer) when is_list(answer) do
      GenServer.start_link(__MODULE__, Game.new(answer))
    end

    def move(pid, guess) do
      GenServer.call(pid, {:move, guess})
    end

    def state(pid) do
      GenServer.call(pid, :state)
    end

    # Server (callbacks)

    def init(game) do
      {:ok, game}
    end

    def handle_call({:move, guess}, _from, game) do
      guess = Game.move(game, guess)
      {:reply, :ok, guess}
    end

    def handle_call(:state, _from, game) do
      state = Game.state(game)
      {:reply, state, game }
    end
end 