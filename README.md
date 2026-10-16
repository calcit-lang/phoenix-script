# Phoenix script in Calcit

Scripts for [Phoenix](https://github.com/kasper/phoenix), built with Calcit
0.30.0 and the JavaScript backend.

使用者影响：当前候选配对正式 Calcit CLI/runtime `0.30.0` 和 JS-FFI `0.2.3`。
快捷键、窗口顺序和 bundle 用法不变；6 处宿主名义强转改用现有 `js-cast`，
在真正宿主边界检查 log/on/recent/focus/maximize 能力，非法宿主对象会提前拒绝。
原公开签名、trait、架构说明和宿主测试不变；不新增包装、强转、脚本或框架。
本轮只在仓库内构建 `dist/phoenix.js` 并验证隔离宿主 fixture，不自动安装到
`~/.phoenix.js`，也不代表已验收用户机器上的真实 Phoenix 会话。此本机配置包没有网页或 COS 部署。

## Setup

Install Phoenix, Calcit 0.30.0, Node.js 24, and Yarn 4. Then install both
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

本轮将 unsafe 6→0，全部 schema/coverage/deprecated/dynamic-method 债务仍为0。
因此删除旧质量基线（可从 Git 恢复），改用完整 strict 和当前 `weak-types` 零债务门禁，
不扩大预算或保留已弃用的 `analyze quality`。本机配置包版本不递增，不创建发布 tag。
0.30.1 尚未正式发布；不把宿主 fixture 或静态探测冒称真实 Phoenix 会话已验收。

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
