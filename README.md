# Phoenix script in Calcit

Scripts for [Phoenix](https://github.com/kasper/phoenix), built with Calcit
0.32.0 and the JavaScript backend.

使用者影响：本轮源码配对正式 Calcit CLI/runtime **0.32.0**，
并升级正式 JS-FFI `0.2.8`。请同步安装 CLI/runtime，再重新生成 bundle，不混用旧 alpha。
快捷键、窗口顺序和 bundle 用法不变；此前迁移的 `js-cast` 继续
在真正宿主边界检查 log/on/recent/focus/maximize 能力，非法宿主对象会提前拒绝。
本次通过官方 formatter 更新 Snapshot 类型语法，公开签名与 trait 合同不变；
保留宿主 fixture、原模块及
压缩 bundle 回放断言，不新增包装、强转、测试脚本或框架。
本轮只在仓库内构建 `dist/phoenix.js` 并验证隔离宿主 fixture，不自动安装到
`~/.phoenix.js`，也不代表已验收用户机器上的真实 Phoenix 会话。此本机配置包没有网页或 COS 部署。

## Setup

Install Phoenix, Calcit 0.32.0, Node.js 24, and Yarn 4. Then install both
Calcit and JavaScript dependencies:

Use canonical `calcit.cirru` and `deps.cirru`; CI rejects retired
`compact.cirru` and `package.cirru`. This local macOS configuration bundle has
no web deployment or COS upload. CI checks host fixtures, not a live Phoenix session.

```bash
caps --strict --ci
yarn install --immutable
caps verify --toolchain
```

Build and test the bundle:

```bash
yarn test
```

此前已将 unsafe 6→0，本轮继续保留完整 strict 与当前 `weak-types` 零债务门禁，
不恢复旧质量基线，不扩大预算或保留已弃用的 `analyze quality`。
本机配置包版本不递增，不创建发布 tag。先确认所用平台的正式 CLI 可用；
正式 Linux CI 不保证每个平台均有预编译 CLI，也不把原 alpha 基线、宿主 fixture
或静态探测冒称真实 Phoenix 会话已验收。本轮不安装或构建本机 Calcit。

原 fixture 继续核对生成模块的注册、两个回调和非法宿主输入；同一脚本另在独立
JavaScript realm 中执行实际 `dist/phoenix.js` 并调用合成回调，核对交付 bundle
仍注册原快捷键、聚焦第二个窗口、最大化第一个窗口。不操作真实窗口。
已退役且仍追踪在仓库中的旧 `.calcit-error.cirru` 移出版本控制，并忽略此生成物；
它包含历史失败，不是当前源码的检查结果，Git 历史及本地 `.calcit/` 仍可恢复。

The production bundle is written to `dist/phoenix.js`. Copy it to
`~/.phoenix.js`, or run `yarn watch` to rebuild that file while editing.

Before changing the Snapshot, read `calcit docs agents --contract` and inspect
the affected definitions with `calcit query context` / `calcit query def`.
The audited source no longer needs the historical `surface-latest-v2` preset.
Use diagnostics to identify the actual contract, then apply a targeted change
through the official structured editor; do not add a compiler rewrite rule for
each application-specific fix. CI remains the quality gate: full strict checks,
zero weak-type debt, and the original host/module/bundle fixture must pass.
Static checks and synthetic fixtures do not prove a live Phoenix session.

## Shortcuts

- `option tab` focuses the second item in Phoenix's recent-window list.
- `control option m` maximizes the current window.

The Calcit adapter validates Phoenix host globals before applying typed
external-object capabilities. Inspect the current contracts with
`calcit query def app.main/PhoenixHost` (and `KeyHost`, `WindowHost`,
`PhoenixWindowHost`).

`docs/architectures/phoenix-ffi.cirru` is a historical, fully implemented architecture
proposal, not a current migration scaffold. Its old type notation is retained as
history; use the current Snapshot queries for 0.32.0 contracts.
