module Yarwf
  class Application

    def call(env)
      [
        200,
        { 'Content-Type' => 'text/html' },
        ['<h1>YARWF is up</h1><p>A good day.</p><p><small>Yet another ruby web framework. Just for fun, by shvetsovdm.</small></p>']
      ]
    end

  end
end
