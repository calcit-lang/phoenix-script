{}
  :schema-version 1
  :feature 'phoenix-ffi
  :doc "|Describe the typed Phoenix JavaScript boundary and the startup registrations."
  :roots $ #{} 'app.main/main! 'app.main/reload!
  :definitions $ {}
    'app.main/main! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Start the Phoenix key bindings."
      :params $ []
      :schema $ :: :fn
        {}
          :args $ []
          :return 'Unit
    'app.main/reload! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Re-register the Phoenix key bindings after reload."
      :params $ []
      :schema $ :: :fn
        {}
          :args $ []
          :return 'Unit
    'app.main/bind-events! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Validate the Phoenix Key API and register supported shortcuts."
      :params $ []
      :schema $ :: :fn
        {}
          :args $ []
          :return 'Unit
          :features $ #{} :js-ffi
    'app.main/log! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Validate Phoenix.log and write one message."
      :params $ [] 'message
      :schema $ :: :fn
        {}
          :args $ [] 'String
          :return 'Unit
          :features $ #{} :js-ffi
    'app.main/get-recent! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Focus the second recent Phoenix window when present."
      :params $ []
      :schema $ :: :fn
        {}
          :args $ []
          :return 'Unit
          :features $ #{} :js-ffi
    'app.main/maximize-current! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Maximize the first recent Phoenix window when present."
      :params $ []
      :schema $ :: :fn
        {}
          :args $ []
          :return 'Unit
          :features $ #{} :js-ffi
    'app.main/PhoenixHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed capability for the Phoenix logging global."
      :schema $ :: 'Trait
      :code $ quote
        deftrait PhoenixHost
          .log $ :: 'Fn
            {}
              :args $ [] 'app.main/PhoenixHost 'String
              :return 'Unit
    'app.main/KeyHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed capability for Phoenix shortcut registration."
      :schema $ :: 'Trait
      :code $ quote
        deftrait KeyHost
          .on $ :: 'Fn
            {}
              :args $ [] 'app.main/KeyHost 'String 'JsObject
                :: 'Fn $ {}
                  :args $ []
                  :return 'Unit
              :return 'Unit
    'app.main/WindowHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed capability for reading the Phoenix recent-window list."
      :schema $ :: 'Trait
      :code $ quote
        deftrait WindowHost
          .recent $ :: 'Fn
            {}
              :args $ [] 'app.main/WindowHost
              :return 'JsObject
    'app.main/PhoenixWindowHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed capability for Phoenix window focus and maximize effects."
      :schema $ :: 'Trait
      :code $ quote
        deftrait PhoenixWindowHost
          .focus $ :: 'Fn
            {}
              :args $ [] 'app.main/PhoenixWindowHost
              :return 'Unit
          .maximize $ :: 'Fn
            {}
              :args $ [] 'app.main/PhoenixWindowHost
              :return 'Unit
  :edges $ #{}
    :: :call 'app.main/main! 'app.main/bind-events!
    :: :call 'app.main/reload! 'app.main/bind-events!
    :: :call 'app.main/bind-events! 'app.main/log!
    :: :call 'app.main/bind-events! 'app.main/get-recent!
    :: :call 'app.main/bind-events! 'app.main/maximize-current!
    :: :type 'app.main/log! 'app.main/PhoenixHost
    :: :type 'app.main/bind-events! 'app.main/KeyHost
    :: :type 'app.main/get-recent! 'app.main/WindowHost
    :: :type 'app.main/get-recent! 'app.main/PhoenixWindowHost
    :: :type 'app.main/maximize-current! 'app.main/WindowHost
    :: :type 'app.main/maximize-current! 'app.main/PhoenixWindowHost
