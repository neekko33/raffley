defmodule RaffleyWeb.CustomComponents do
  use RaffleyWeb, :html

  attr :status, :atom, required: true, values: [:upcoming, :open, :closed]
  attr :class, :string, required: false, default: nil

  def badge(assigns) do
    ~H"""
    <div class={[
      "border-2 rounded px-2 py-1 font-semibold text-xs",
      @status == :upcoming && "text-lime-600 border-lime-600",
      @status == :open && "text-amber-600 border-amber-600",
      @status == :closed && "text-gray-600 border-gray-600",
      @class
    ]}>
      {String.upcase(to_string(@status))}
    </div>
    """
  end

  attr :raffle, Raffley.Raffle, required: true

  def raffle_card(assigns) do
    ~H"""
    <div class="border border-gray-200 rounded-lg p-4 shadow-md cursor-pointer w-[300px]">
      <div class="flex justify-center">
        <img
          src={@raffle.image_path}
          alt={@raffle.prize}
          class="w-auto h-[200px] object-cover mb-4 rounded hover:scale-105 transition-transform duration-200"
        />
      </div>
      <h2 class="text-xl font-semibold mb-2 text-blue-600">{@raffle.prize}</h2>
      <div class="flex justify-between mt-6 text-gray-700 items-center">
        <div class="font-semibold">${@raffle.ticket_price} / Ticket</div>
        <.badge status={@raffle.status} />
      </div>
    </div>
    """
  end

  slot :inner_block, required: true
  slot :details

  def banner(assigns) do
    assigns = assign(assigns, :emoji, ~w(🎉 🚀 🎊 🌟) |> Enum.random())

    ~H"""
    <div class="w-[50%] bg-gradient-to-r from-blue-400 via-blue-500 to-blue-600 border border-blue-300 rounded-lg p-4 mb-6 gap-4">
      <h1 class="text-white text-2xl font-bold gap-2 flex justify-center items-center">
        {render_slot(@inner_block)}
      </h1>
      <div :for={details <- @details} :if={@details != []} class="text-white text-center mt-4 text-xl">
        {render_slot(details, @emoji)}
      </div>
    </div>
    """
  end
end
