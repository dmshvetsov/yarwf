module Yarwf
  class Application

    def call(env)
      controller_class, action = controller_and_action(env)
      controller = controller_class.new(env)
      return_value = controller.send(action)
      [
        200,
        { 'Content-Type' => 'text/html' },
        [return_value]
      ]
    rescue NameError
      default_response
    end

    def controller_and_action(env)
      _, cont_path, action, _= env['PATH_INFO'].split('/', 4)
      controller = "#{cont_path.capitalize}Controller"

      [Object.const_get(controller), action]
    end

    private

    def default_response
      [
        200,
        { 'Content-Type' => 'text/html' },
        ['<h1>YARWF is up</h1><p>A good day.</p><p><small>Yet another ruby web framework. Just for fun, by shvetsovdm.</small></p>']
      ]
    end

  end
end
