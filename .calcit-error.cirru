
{} (:message "|expected defn args to be symbols, got: ([] ([] \'windows ([] \'.!recent \'js/Window)) ([] \'w0 ([] \'.-0 \'windows)))")
  :stack $ []
    {}
      :args $ []
      :code $ quote
        defn maximize-current! $ let
            windows $ .!recent js/Window
            w0 $ .-0 windows
          if (some? w0) (.!maximize w0)
      :kind :fn
      :def |app.main/maximize-current!
    {} (:def |calcit.core/fn)
      :args $ [] ([] '& 'events) ([] 'maximize-current!)
      :code $ quote
        fn (& events) (maximize-current!)
      :kind :macro
    {}
      :code $ quote
        defn bind-events! () (log! |demo4)
          .!on js/Key |tab (js-array |option)
            fn (& events) (get-recent!)
          .!on js/Key |m (js-array |control |option)
            fn (& events) (maximize-current!)
      :kind :fn
      :args $ []
      :def |app.main/bind-events!
    {}
      :args $ []
      :def |app.main/main!
      :kind :fn
      :code $ quote
        defn main! () $ bind-events!
