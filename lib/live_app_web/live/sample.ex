defmodule LiveAppWeb.SampleLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  @impl true
  def mount(_session, _param, socket) do
    {:ok, assign(socket, :name, "Zain Ul Abdin")}
  end

  # def render(assigns) do
  #   ~L"""
  #   <h1>
  #   <%= @name %> </h2>
  #   """
  # end
end
