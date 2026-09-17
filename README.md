# Phoenix script in Calcit

Scripts for [Phoenix](https://github.com/kasper/phoenix), built with Calcit
0.15.3 and the JavaScript backend.

## Setup

Install Phoenix, Calcit 0.15.3, Node.js 24, and Yarn 4. Then install both
Calcit and JavaScript dependencies:

```bash
caps --strict --ci
yarn install --immutable
```

Build and test the bundle:

```bash
yarn test
```

The production bundle is written to `dist/phoenix.js`. Copy it to
`~/.phoenix.js`, or run `yarn watch` to rebuild that file while editing.

Before changing the Snapshot, read `calcit docs read upgrade` and preview the
current stable syntax rules with
`calcit fix --preset surface-latest-v2 --format edn`.

## Shortcuts

- `option tab` focuses the second item in Phoenix's recent-window list.
- `control option m` maximizes the current window.

The Calcit adapter validates Phoenix host globals before applying the typed
external-object capabilities documented in
`docs/architectures/phoenix-ffi.cirru`.
