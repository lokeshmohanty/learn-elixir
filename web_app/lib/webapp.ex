defmodule WebApp do
  use Application

  def start(_type, _args) do
    port = 8080
    IO.puts "WebApp running on port #{port}"
    dispatch_config = :cowboy_router.compile([
      { :_,
        [
          {:_, CowboyHandler, []},
        ]
      }
    ])

    :cowboy.start_http(:http, 10,[{:port, port}],[{ :env, [{:dispatch, dispatch_config}]}])

    Supervisor.start_link([], strategy: :one_for_one)
  end
end


