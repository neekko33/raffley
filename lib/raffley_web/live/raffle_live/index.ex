defmodule RaffleyWeb.RaffleLive.Index do
  use RaffleyWeb, :live_view

  alias Raffley.Raffles

  import RaffleyWeb.CustomComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :raffles, Raffles.list_raffles())}
  end

  def render(assigns) do
    ~H"""
    <div class="p-6">
      <h1 class="text-2xl font-bold mb-6">Raffles</h1>
      <div class="grid grid-cols-6 gap-4">
        <.raffle_card :for={raffle <- @raffles} raffle={raffle} />
      </div>
    </div>
    """
  end
end
