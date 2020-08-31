defmodule TextInput do
  use Phoenix.LiveComponent

  @impl true
  def update(assigns, socket) do
    IO.puts("Updating text input")
    {:ok, assign(socket, assigns)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div>
      Text input
      <%= live_component(@socket, Context,
        id: "__context__text_input",
        get: %{{Form, :form} => :my_form, field: :my_field},
        __context__: @__context__) do %>
        <h2>Form: <%= @my_form %></h2>
        <h2>Field: <%= @my_field %></h2>
      <% end %>
    </div>
    """
  end
end
