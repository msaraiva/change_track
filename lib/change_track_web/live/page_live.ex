defmodule ChangeTrackWeb.PageLive do
  use ChangeTrackWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, counter: 0, value: 0)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <button type="button" phx-click="update_counter">Update counter</button>
    <hr>

    <h2>1. Using <code>@value</code> works</h2>
    <div style="border: solid 1px black; padding: 10px">
      <h2>Value: <%= @value %></h2>
      <%= live_component @socket, Inc, value: @value do %>
        <h2>Value: <%= @value %></h2>
        <h2>Counter: <%= @counter %></h2>
        <%= live_component @socket, UpdateTracer, id: 1 %>
      <% end %>
    </div>

    <hr>

    <h2>2. Using <code>@value</code> + <code>if</code> works</h2>
    <div style="border: solid 1px black; padding: 10px">
      <h2>Value: <%= @value %></h2>
      <%= live_component @socket, Inc, value: @value do %>
        <%= if @check do %>
          <h2>Value: <%= @value %></h2>
          <h2>Counter: <%= @counter %></h2>
          <%= live_component @socket, UpdateTracer, id: 2 %>
        <% end %>
      <% end %>
    </div>

    <hr>

    <h2>3. Using <code>@value</code> + <code>cond</code> disables change tracking</h2>
    <div style="border: solid 1px black; padding: 10px">
      <h2>Value: <%= @value %></h2>
      <%= live_component @socket, Inc, value: @value do %>
        <%= cond do %>
          <%= @check -> %>
            <h2>Value: <%= @value %></h2>
            <h2>Counter: <%= @counter %></h2>
            <%= live_component @socket, UpdateTracer, id: 3 %>
        <% end %>
      <% end %>
    </div>

    <hr>

    <h2>4. Using variable <code>value</code> disables change tracking</h2>
    <div style="border: solid 1px black; padding: 10px">
      <h2>Value: <%= @value %></h2>
      <%= live_component @socket, Inc, value: @value do %>
        <%= [value: value, check: _check] -> %>
          <h2>Value: <%= value %></h2>
          <h2>Counter: <%= @counter %></h2>
          <%= live_component @socket, UpdateTracer, id: 4 %>
      <% end %>
    </div>
    """
  end

  @impl true
  def handle_event("update_counter", %{}, socket) do
    {:noreply, assign(socket, counter: socket.assigns.counter + 1)}
  end
end
