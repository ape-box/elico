defmodule Elico.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_input", %{"body" => body}, socket) do
    broadcast! socket, "new_input", %{body: body}
    {:noreply, socket}
  end

  def handle_out("new_input", payload, socket) do
    push socket, "new_input", payload
    {:noreply, socket}
  end
end
