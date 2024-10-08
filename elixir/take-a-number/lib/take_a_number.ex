defmodule TakeANumber do
  def start() do
    spawn(fn ->
      listen(0, false)
    end)
  end

  defp listen(num, stopped?) do
    receive do
      {:report_state, pid} ->
        send(pid, num)
        stopped? || listen(num, stopped?)

      {:take_a_number, pid} ->
        num = num + 1
        send(pid, num)
        stopped? || listen(num, stopped?)

      :stop ->
        listen(nil, true)

     _ ->
      stopped? || listen(num, stopped?)
    end
  end
end
