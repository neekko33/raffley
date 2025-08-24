defmodule RaffleyWeb.RaffleLive.Index do
  use RaffleyWeb, :live_view

  alias Raffley.Raffles

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :raffles, Raffles.list_raffles())}
  end

  def render(assigns) do
    ~H"""
    <div class="p-6">
      <h1 class="text-2xl font-bold mb-6">Raffles</h1>
      <div class="grid grid-cols-6 gap-4">
        <%= for raffle <- @raffles do %>
          <div class="border border-gray-200 rounded-lg p-4 shadow-md cursor-pointer">
            <div class="flex justify-center">
              <img
                src={raffle.image_path}
                alt={raffle.prize}
                class="w-auto h-[200px] object-cover mb-4 rounded hover:scale-105 transition-transform duration-200"
              />
            </div>
            <h2 class="text-xl font-semibold mb-2 text-blue-600">{raffle.prize}</h2>
            <div class="flex justify-between mt-6 text-gray-700 font-semibold items-center">
              <div>${raffle.ticket_price} / Ticket</div>
              <div class="border-2 rounded px-2 py-1 text-green-600">
                {String.upcase(to_string(raffle.status))}
              </div>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
