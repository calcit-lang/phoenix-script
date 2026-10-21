import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import { runInNewContext } from "node:vm";

const logs = [];
const registrations = [];
const focused = [];
const maximized = [];
const windows = [
  { maximize: () => maximized.push(0), focus: () => focused.push(0) },
  { maximize: () => maximized.push(1), focus: () => focused.push(1) },
];

globalThis.Phoenix = { log: (message) => logs.push(message) };
globalThis.Key = {
  on: (key, modifiers, callback) => {
    registrations.push({ key, modifiers: [...modifiers], callback });
  },
};
globalThis.Window = { recent: () => windows };

const bundleHost = { Phoenix: globalThis.Phoenix, Key: globalThis.Key, Window: globalThis.Window, console };

const app = await import("../js-out/app.main.mjs");

assert.equal(app.main_$x_(), undefined);
assert.deepEqual(logs, ["demo4"]);
assert.equal(registrations.length, 2);
assert.deepEqual(
  registrations.map(({ key, modifiers }) => ({ key, modifiers })),
  [
    { key: "tab", modifiers: ["option"] },
    { key: "m", modifiers: ["control", "option"] },
  ],
);

registrations[0].callback();
registrations[1].callback();
assert.deepEqual(focused, [1]);
assert.deepEqual(maximized, [0]);

globalThis.Window = { recent: () => [windows[0]] };
assert.equal(app.get_recent_$x_(), undefined);
assert.deepEqual(focused, [1]);

globalThis.Phoenix = null;
assert.throws(() => app.log_$x_("bad"), /Phoenix expected Object/);

globalThis.Phoenix = { log: () => undefined };
globalThis.Key = null;
assert.throws(() => app.bind_events_$x_(), /Key expected Object/);

globalThis.Window = { recent: () => null };
assert.throws(() => app.get_recent_$x_(), /Window\.recent expected Object/);

// Replay the shipped, minified bundle with the same synthetic host, not a live Phoenix session.
logs.length = registrations.length = focused.length = maximized.length = 0;
runInNewContext(await readFile(new URL("../dist/phoenix.js", import.meta.url), "utf8"), bundleHost,
  { filename: "phoenix.js", timeout: 5000 });
for (const { callback } of registrations) callback();
assert.deepEqual({ logs, keys: registrations.map(({ key, modifiers }) => ({ key, modifiers })), focused, maximized }, {
  logs: ["demo4"],
  keys: [{ key: "tab", modifiers: ["option"] }, { key: "m", modifiers: ["control", "option"] }],
  focused: [1],
  maximized: [0],
});

console.log("Phoenix host smoke test passed");
