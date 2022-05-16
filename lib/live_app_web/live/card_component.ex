defmodule LiveAppWeb.CardComponent do
  use LiveAppWeb, :live_component
  use Phoenix.HTML
  alias LiveApp.Game

  @impl true
  def preload(list_of_assigns) do
    cards =
      list_of_assigns
      |> Enum.map(&(&1.id))
      |> Game.get_cards()

    Enum.map(list_of_assigns, fn(assigns) ->
    card = Enum.find(cards, fn(card) -> assigns.id == card.id end)
    Map.merge(assigns, %{card: card})
    end)
  end

  @impl true
  def update(assigns, socket) do
    {:ok,
      socket
      |> assign(assigns)
      |> assign(:answered, false)
      |> assign(:correct, false)
    }
  end
  @impl true
  def handle_event("answer", %{"question" => params}, socket) do
    case Game.correct?(params["id"], params["answer"]) do
      nil ->
        send(self(), {:wrong_answer, %{count: 1}})
        {:noreply,
        socket
        |> assign(answered: true)
        |> assign(:correct, false)
      }
      _answer ->
        send(self(), {:correct_answer, %{count: 1}})
        {:noreply,
        socket
        |> assign(answered: true)
        |> assign(:correct, true)
      }

    end

  end

  def handle_event("new", _params, socket) do
    card = Game.list_cards() |> Enum.random()
    {:noreply,
     socket
     |> assign(:answered, false)
     |> assign(:card, card)}
  end

end
