defmodule LiveAppWeb.CardLive.Index do
  use LiveAppWeb, :live_view

  alias LiveApp.Game
  alias LiveApp.Game.Card

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :cards, list_cards())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Card")
    |> assign(:card, Game.get_card!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Card")
    |> assign(:card, %Card{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Cards")
    |> assign(:card, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    card = Game.get_card!(id)
    {:ok, _} = Game.delete_card(card)

    {:noreply, assign(socket, :cards, list_cards())}
  end

  defp list_cards do
    Game.list_cards()
  end
end
