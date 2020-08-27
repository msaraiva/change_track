defmodule UpdateTracer do
  use Phoenix.LiveComponent

  def update(assigns, socket) do
    IO.puts("Updating tracer #{assigns.id}")
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~L"""
    <div>
      UpdateTracer
    </div>
    """
  end
end
