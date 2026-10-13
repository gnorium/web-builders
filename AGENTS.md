# Repository guidance

This directory is its own Git repository. The parent Gnorium workspace is not a repository; run Git commands here and inspect sibling repositories separately.

- Preserve unrelated working changes. When renaming an internal API, update callers in sibling packages rather than leave obsolete aliases.
- Run focused checks for the changed behavior. Do not run full server/browser suites unless requested.
- Keep build caches and `.build` directories. Diagnose build/toolchain errors before rebuilding; do not wipe caches to troubleshoot.
- Batch related changes before building. Deployment requires an explicit user request; a local build or server restart is not deployment.
- If committing authorized work, omit attribution trailers and push normally after the commit; never force-push.

## Embedded Swift client

- CLIENT-reachable code includes unguarded helpers called by hydration. Use `EmbeddedSwiftUtilities` string helpers rather than Unicode normalization, String-keyed dictionaries/sets, or String equality/hash operations.
- Prefer pattern matching for optional strings and String-backed enums. Diagnose undefined WASM symbols from their call sites instead of guessing or clearing caches.
- Separate DOM queries return fresh Swift wrappers. Compare the bridge's stable numeric node IDs, not Swift reference identity (`===`).
- Add missing standard browser APIs to the bridge and typed API packages rather than simulate them in views.

## Builder contracts

Strings are escaped text. Typed nodes/components remain markup through the DSL. Fix strings-of-HTML at their producer; do not add raw-HTML escapes to surface views.

`descendant(".a", ".b")` builds a chain, not a selector list. Use `selector("& .a", "& .b")` for separate selectors. Stored property names can shadow CSS builder functions; diagnose the actual generated selector/property.
