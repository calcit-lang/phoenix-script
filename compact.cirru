
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!)
    :modules $ []
    :version |0.0.1
  :entries $ {}
  :files $ {}
    |app.main $ {}
      :ns $ quote (ns app.main)
      :defs $ {}
        |main! $ quote
          defn main! () $ bind-events!
        |reload! $ quote
          defn reload! () $ bind-events!
        |bind-events! $ quote
          defn bind-events! () (log! "\"demo4")
            .!on js/Key "\"tab" (js-array "\"option")
              fn (& events) (get-recent!)
            .!on js/Key "\"m" (js-array "\"control" "\"option")
              fn (& events) (maximize-current!)
        |log! $ quote
          defn log! (& args) (js/Phoenix.log & args)
        |get-recent! $ quote
          defn get-recent! () $ let
              windows $ .!recent js/Window
              w0 $ .-1 windows
            if (some? w0) (.!focus w0)
        |maximize-current! $ quote
          defn maximize-current! () $ let
              windows $ .!recent js/Window
              w0 $ .-0 windows
            if (some? w0) (.!maximize w0)
