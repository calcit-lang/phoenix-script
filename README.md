# Phoenix script in Calcit

Scripts for [Phoenix](https://github.com/kasper/phoenix), built with Calcit
0.29.3 and the JavaScript backend.

使用者影响：当前候选使用正式 Calcit CLI/runtime `0.29.3` 和 JS-FFI `0.2.3`。
快捷键、窗口顺序、宿主校验与 bundle 用法不变，不改 Snapshot 或原测试。
本轮只在仓库内构建 `dist/phoenix.js` 并验证隔离宿主 fixture，不自动安装到
`~/.phoenix.js`，也不代表已验收用户机器上的真实 Phoenix 会话。此本机配置包没有网页或 COS 部署。

## Setup

Install Phoenix, Calcit 0.29.3, Node.js 24, and Yarn 4. Then install both
Calcit and JavaScript dependencies:

Use canonical `calcit.cirru` and `deps.cirru`; CI rejects retired
`compact.cirru` and `package.cirru`. This local macOS configuration bundle has
no web deployment or COS upload. CI checks host fixtures, not a live Phoenix session.

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
