defmodule LiveAppWeb.CardHandler do
  use Phoenix.Component
  def greet(assigns) do
    ~H"""
    <p>Congratulations! you answered <%= assigns.question %></p>
    <p>Correct answer is: <%= assigns.answer %></p>
    """
  end

  def warn(assigns) do
    ~H"""
    <p>Oops! your answer for question <%= assigns.question %> is: </p>
    <p>Correct answer was: <%= assigns.answer %></p>
    """
  end
end
