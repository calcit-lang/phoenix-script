import assert from "node:assert/strict";

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

console.log("Phoenix host smoke test passed");
