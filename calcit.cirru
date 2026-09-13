
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js)
      :reload-fn 'app.main/reload!
      :feature-policy $ {}
      :modules $ [] |js-ffi/
      :type-slots $ {}
  :files $ {} $ 'app.main
    %{} 'FileEntry
      :defs $ {}
        'KeyHost $ %{} 'CodeEntry
          :doc "|Typed capability for Phoenix shortcut registration."
          :code $ quote $ deftrait KeyHost
            .on $ :: 'Fn $ {}
              :args $ [] 'app.main/KeyHost 'String 'JsObject $ :: 'Fn
                {}
                  :args $ []
                  :return 'Unit
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object)
          :schema $ :: 'Trait
        'PhoenixHost $ %{} 'CodeEntry
          :doc "|Typed capability for the Phoenix logging global."
          :code $ quote $ deftrait PhoenixHost
            .log $ :: 'Fn $ {}
              :args $ [] 'app.main/PhoenixHost 'String
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object)
          :schema $ :: 'Trait
        'PhoenixWindowHost $ %{} 'CodeEntry
          :doc "|Typed capability for Phoenix window focus and maximize effects."
          :code $ quote $ deftrait PhoenixWindowHost
            .focus $ :: 'Fn $ {}
              :args $ [] 'app.main/PhoenixWindowHost
              :return 'Unit
            .maximize $ :: 'Fn $ {}
              :args $ [] 'app.main/PhoenixWindowHost
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object)
          :schema $ :: 'Trait
        'WindowHost $ %{} 'CodeEntry
          :doc "|Typed capability for reading the Phoenix recent-window list."
          :code $ quote $ deftrait WindowHost
            .recent $ :: 'Fn $ {}
              :args $ [] 'app.main/WindowHost
              :return 'JsObject
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object)
          :schema $ :: 'Trait
        'bind-events! $ %{} 'CodeEntry
          :doc "|Validate the Phoenix Key API and register supported shortcuts."
          :code $ quote $ defn bind-events! ()
            do (log! |demo4)
              let
                  raw-key-api $ contract/expect-object |Key js/Key
                  key-api $ unsafe-coerce raw-key-api 'app.main/KeyHost
                do
                  .!on key-api |tab (js-array |option) get-recent!
                  .!on key-api |m (js-array |control |option) maximize-current!
                  , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'get-recent! $ %{} 'CodeEntry
          :doc "|Focus the second recent Phoenix window when present."
          :code $ quote $ defn get-recent! ()
            let
                raw-window-api $ contract/expect-object |Window js/Window
                window-api $ unsafe-coerce raw-window-api 'app.main/WindowHost
                windows $ contract/expect-object |Window.recent $ .!recent window-api
                recent-window $ aget windows 1
              if (js-present? recent-window)
                let
                    raw-focused-window $ contract/expect-object |Window.recent[1] recent-window
                    focused-window $ unsafe-coerce raw-focused-window 'app.main/PhoenixWindowHost
                  do (.!focus focused-window) &unit
                , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'log! $ %{} 'CodeEntry
          :doc "|Validate Phoenix.log and write one message."
          :code $ quote $ defn log! (message)
            let
                raw-phoenix $ contract/expect-object |Phoenix js/Phoenix
                phoenix $ unsafe-coerce raw-phoenix 'app.main/PhoenixHost
              do (.!log phoenix message) &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'main! $ %{} 'CodeEntry
          :doc "|Start the Phoenix key bindings."
          :code $ quote $ defn main! () (bind-events!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'maximize-current! $ %{} 'CodeEntry
          :doc "|Maximize the first recent Phoenix window when present."
          :code $ quote $ defn maximize-current! ()
            let
                raw-window-api $ contract/expect-object |Window js/Window
                window-api $ unsafe-coerce raw-window-api 'app.main/WindowHost
                windows $ contract/expect-object |Window.recent $ .!recent window-api
                recent-window $ aget windows 0
              if (js-present? recent-window)
                let
                    raw-current-window $ contract/expect-object |Window.recent[0] recent-window
                    current-window $ unsafe-coerce raw-current-window 'app.main/PhoenixWindowHost
                  do (.!maximize current-window) &unit
                , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry
          :doc "|Re-register the Phoenix key bindings after reload."
          :code $ quote $ defn reload! () (bind-events!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require $ js-ffi.contract :as contract
