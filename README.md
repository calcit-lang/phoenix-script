# Phoenix script in Calcit

Scripts for [Phoenix](https://github.com/kasper/phoenix), built with Calcit
0.13.77 and the JavaScript backend.

## Setup

Install Phoenix, Calcit 0.13.77, Node.js 24, and Yarn 4. Then install both
Calcit and JavaScript dependencies:

```bash
caps --ci
yarn install --immutable
```

Build and test the bundle:

```bash
yarn test
```

The production bundle is written to `dist/phoenix.js`. Copy it to
`~/.phoenix.js`, or run `yarn watch` to rebuild that file while editing.

## Shortcuts

- `option tab` focuses the second item in Phoenix's recent-window list.
- `control option m` maximizes the current window.

The Calcit adapter validates Phoenix host globals before applying the typed
external-object capabilities documented in
`docs/architectures/phoenix-ffi.cirru`.
