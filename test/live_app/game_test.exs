defmodule LiveApp.GameTest do
  use LiveApp.DataCase

  alias LiveApp.Game

  describe "cards" do
    alias LiveApp.Game.Card

    import LiveApp.GameFixtures

    @invalid_attrs %{answer: nil, question: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Game.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Game.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{answer: "some answer", question: "some question"}

      assert {:ok, %Card{} = card} = Game.create_card(valid_attrs)
      assert card.answer == "some answer"
      assert card.question == "some question"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{answer: "some updated answer", question: "some updated question"}

      assert {:ok, %Card{} = card} = Game.update_card(card, update_attrs)
      assert card.answer == "some updated answer"
      assert card.question == "some updated question"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_card(card, @invalid_attrs)
      assert card == Game.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Game.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Game.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Game.change_card(card)
    end
  end
end
