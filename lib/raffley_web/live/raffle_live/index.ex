defmodule RaffleyWeb.RaffleLive.Index do
  use RaffleyWeb, :live_view

  alias Raffley.Raffles

  import RaffleyWeb.CustomComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :raffles, Raffles.list_raffles())}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="p-6 w-full flex flex-col items-center gap-6">
        <.banner>
          <.icon name="hero-sparkles-solid" class="size-8" /> Mystery Raffle Coming Soon!
          <:details :let={vibe}>
            To Be Revealed Tomorrow {vibe}
          </:details>
          <:details>
            Any guesses?
          </:details>
        </.banner>
        <div class="flex gap-6">
          <.raffle_card :for={raffle <- @raffles} raffle={raffle} />
        </div>
      </div>
    </Layouts.app>
    """
  end
end
