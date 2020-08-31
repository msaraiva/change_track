defmodule Context do
  use Phoenix.LiveComponent

  @impl true
  def mount(socket) do
    {:ok, assign(socket, set: %{}, get: [])}
  end

  def render(assigns) do
    ~L"""
    <%= @inner_content.([
        __slot__: {:default, 0},
        __context__: Map.merge(@__context__, Map.new(@set)),
      ] ++ Enum.map(@get, fn {k, v} -> {v, @__context__[k]} end))
    %>
    """
  end
end
