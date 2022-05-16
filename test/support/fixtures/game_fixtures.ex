defmodule LiveApp.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveApp.Game` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        answer: "some answer",
        question: "some question"
      })
      |> LiveApp.Game.create_card()

    card
  end
end
