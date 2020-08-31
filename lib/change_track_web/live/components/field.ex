defmodule Field do
  use Phoenix.LiveComponent

  @impl true
  def update(assigns, socket) do
    IO.puts("Updating field")
    {:ok, assign(socket, assigns)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div>
      Fake Field
      <%= live_component(@socket, Context,
        id: "__context__field",
        set: [field: :fake_field],
        __context__: @__context__) do %>
        <%= @inner_content.(__slot__: {:default, 0}, __context__: @__context__) %>
      <% end %>
    </div>
    """
  end
end
