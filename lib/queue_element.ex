defmodule EctoPerformance.QueueElement do
  import Ecto.Query
  use Ecto.Schema
  alias EctoPerformance.QueueElement
  alias EctoPerformance.Repo
  @derive [Poison.Encoder]
  defstruct [
    :timestamp, :offered_calls, :handled_calls, :handlin_time, :call_queue_id
  ]

  schema "queue_elements" do
    field :timestamp,     Ecto.DateTime
    field :offered_calls, :integer
    field :handled_calls, :integer
    field :handling_time, :integer
    field :call_queue_id, :integer
  end

  def keyword_query do
    query = from qe in QueueElement,
         select: qe
    Repo.all(query)
  end

  def by_id(queue_id) do
    QueueElement
    |> where(call_queue_id: ^queue_id)
    |> order_by(:timestamp)
    |> Repo.all
  end

  def to_json(data) do
    data |> Poison.encode!
  end

  def count(queue_id) do
    Repo.one(
      from qe in QueueElement, where: qe.call_queue_id == ^queue_id, select: count("*")
    )
  end
end
