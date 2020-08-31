defmodule ChangeTrackWeb.ContextLive do
  use ChangeTrackWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, counter: 0, __context__: %{})}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <button type="button" phx-click="update_counter">Update counter</button>
    <hr>

    <h2>Counter: <%= @counter %></h2>

    <div style="border: solid 1px black; padding: 10px">
      <%= live_component @socket, Form, __context__: @__context__ do %>
        <%= case @__slot__ do %>
          <%= {:default, 0} -> %>
            <h2>Counter: <%= @counter %></h2>
            <%= live_component @socket, Field, __context__: @__context__ do %>
              <%= live_component @socket, TextInput, __context__: @__context__ %>
            <% end %>
            <%= live_component @socket, UpdateTracer, id: 1 %>
            <%= live_component @socket, UpdateTracer, id: 2, __context__: @__context__ %>
        <% end %>
      <% end %>
    </div>
    """
  end

  @impl true
  def handle_event("update_counter", %{}, socket) do
    {:noreply, assign(socket, counter: socket.assigns.counter + 1)}
  end
end
