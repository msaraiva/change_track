defmodule NumberGenerator do
  use Phoenix.LiveComponent

  @impl true
  def mount(socket) do
    IO.puts("Mount NumberGenerator")
    # number = :erlang.unique_integer([:positive])
    number = 123
    {:ok, assign(socket, number: number)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <%= @inner_content.(number: @number) %>
    """
  end
end
