defmodule LiveAppWeb.GameLive do
  use Phoenix.LiveView
  alias LiveApp.Game

  @impl true
  def mount(_params, _session, socket) do
    cards = Game.list_cards() |> Enum.shuffle() |> Enum.slice(0..2)
    socket = socket |> assign(:correct_answers, 0) |> assign(:wrong_answers, 0) |> assign(:total_answers, 0)
    {:ok, assign(socket, cards: cards)}
  end
@impl true
  def handle_info({:correct_answer, _count}, socket) do
    {:noreply,
    socket
    |> assign(:correct_answers, socket.assigns.correct_answers+1)
    |> assign(:total_answers, socket.assigns.total_answers+1)
  }
  end
  def handle_info({:wrong_answer, _count}, socket) do
    {:noreply,
    socket
    |> assign(:wrong_answers, socket.assigns.wrong_answers+1)
    |> assign(:total_answers, socket.assigns.total_answers+1)
  }
  end
end
