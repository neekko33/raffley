defmodule Raffley.Raffle do
  defstruct [:id, :prize, :ticket_price, :status, :image_path, :description]
end

defmodule Raffley.Raffles do
  def list_raffles do
    [
      %Raffley.Raffle{
        id: 1,
        prize: "Autographed Jersey",
        ticket_price: 2,
        status: :open,
        image_path: "/images/jersey.jpeg",
        description: "Win an autographed jersey!"
      },
      %Raffley.Raffle{
        id: 2,
        prize: "Coffee With A Yeti",
        ticket_price: 3,
        status: :upcoming,
        image_path: "/images/yeti.webp",
        description: "Win coffee with a yeti!"
      },
      %Raffley.Raffle{
        id: 3,
        prize: "Vintage Comic Book",
        ticket_price: 1,
        status: :closed,
        image_path: "/images/comic_book.jpg",
        description: "Win a vintage comic book!"
      }
    ]
  end
end
