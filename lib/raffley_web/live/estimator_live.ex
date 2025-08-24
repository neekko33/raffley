defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :tick, 2000)
    end

    {:ok, assign(socket, tickets: 0, price: 3)}
  end

  def handle_event("add_ticket", _unsigned_params, socket) do
    {:noreply, update(socket, :tickets, &(&1 + 1))}
  end

  def handle_event("set_price", %{"price" => price}, socket) do
    {:noreply, assign(socket, price: String.to_integer(price))}
  end

  def handle_info(:tick, socket) do
    # Process.send_after(self(), :tick, 2000)
    {:noreply, update(socket, :tickets, &(&1 + 10))}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <section class="flex flex-col justify-center items-center">
        <h1 class="text-4xl font-bold">Raffle Estimator</h1>
        <div class="flex gap-6 text-2xl mt-8 items-center">
          <button
            class="bg-blue-400 text-white rounded px-3 py-1 cursor-pointer"
            phx-click="add_ticket"
          >
            +
          </button>
          <div>{@tickets}</div>
          <div>@</div>
          <div>${@price}</div>
          <div>=</div>
          <div>${@tickets * @price}</div>
        </div>
        <form class="mt-8" phx-change="set_price">
          <label for="price">Ticket Price:</label>
          <input
            class="border border-gray-300 rounded px-2 py-1"
            type="number"
            name="price"
            value={@price}
          />
        </form>
      </section>
    </Layouts.app>
    """
  end
end
