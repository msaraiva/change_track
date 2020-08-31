defmodule Form do
  use Phoenix.LiveComponent

  @impl true
  def update(assigns, socket) do
    IO.puts("Updating form")
    {:ok, assign(socket, assigns)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div>
      Fake Form
      <%= live_component(@socket, Context,
        id: "__context__form",
        set: %{{__MODULE__, :form} => :fake_form},
        __context__: @__context__
        ) do %>
        <%= @inner_content.(__slot__: {:default, 0}, __context__: @__context__) %>
      <% end %>
    </div>
    """
  end
end
