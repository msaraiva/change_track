defmodule ChangeTrackWeb.PageLive do
  use ChangeTrackWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, counter: 0)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <button type="button" phx-click="update_counter">Update counter</button>
    <hr>

    <h2>Counter: <%= @counter %></h2>

    <div style="border: solid 1px black; padding: 10px">
      <%= live_component @socket, NumberGenerator, id: "number_generator" do %>
        <h2>Number: <%= @number %></h2>
        <h2>Counter: <%= @counter %></h2>
        <%= live_component @socket, UpdateTracer, id: 1, number: @number %>
        <%= live_component @socket, UpdateTracer, id: 2 %>
      <% end %>
    </div>
    """
  end

  @impl true
  def handle_event("update_counter", %{}, socket) do
    {:noreply, assign(socket, counter: socket.assigns.counter + 1)}
  end
end
