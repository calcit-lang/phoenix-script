# Upgrade Calcit 0.15.3 and syntax rules

- Raise Calcit and `@calcit/procs` from 0.15.2 to 0.15.3; keep `js-ffi` on its latest 0.1.17 release.
- Apply the validated `surface-latest-v2` plan to remove redundant `do` wrappers while preserving explicit `&unit` returns at host-effect boundaries.
- Keep the existing zero-unresolved quality baseline and run Caps in strict CI mode.
- Stop marking `calcit.cirru` as generated so source changes remain visible in review.
- Refresh setup and maintenance documentation to the exact 0.15.3 toolchain.
