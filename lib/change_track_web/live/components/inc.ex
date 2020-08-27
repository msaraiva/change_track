defmodule Inc do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <%= @inner_content.(value: @value + 1, check: true) %>
    """
  end
end
