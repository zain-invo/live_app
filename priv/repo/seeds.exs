# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveApp.Repo.insert!(%LiveApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias LiveApp.Game

Game.create_card(%{"question" => "What are the dying words of Charles Foster Kane in the movie Citizen Kane?", "answer" => "Rosebud"})
Game.create_card(%{"question" => "I could'a been a contender!", "answer" => "On the Waterfront"})
Game.create_card(%{"question" => "️What is the highest-grossing movie of all time?", "answer" => "Avengers: Endgame"})
Game.create_card(%{"question" => "️Here's looking at you, kid.", "answer" => "Casablanca"})
Game.create_card(%{"question" => "What actress has won the most Academy Awards for Best Actress?", "answer" => "Katharine Hepburn"})
Game.create_card(%{"question" => "️What was the first James Bond movie?", "answer" => "Dr. No"})
Game.create_card(%{"question" => "What actor has won the most Academy Awards for Best Actor?", "answer" => "Jack Nicholson"})
Game.create_card(%{"question" => "What's the only movie Martin Scorsese has won an Academy Award for Best Director", "answer" => "The Departed"})
