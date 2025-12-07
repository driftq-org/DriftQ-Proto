# DriftQ Proto

Shared **Protocol Buffers** for the **DriftQ** ecosystem (core broker, clients, brain, and cloud).
This repository serves as the single source of truth for **admin**, **policy**, and **telemetry** APIs.

---

## Why a Separate Repository?

- Keeps API contracts versioned and language-agnostic
- Enables automated code generation for Go / TypeScript / Python
- Prevents drift between DriftQ services
- Simplifies dependency management across projects

---

## Layout

```
proto/driftq/
├── policy.proto     # AI policy hook (routing & predictions)
├── admin.proto      # Broker admin API (topics, partitions, groups)
└── telemetry.proto  # Broker → brain/ops stream events
```

---

## Requirements

- [`buf`](https://buf.build) — for linting and codegen
- `protoc` ≥ 3.21 (automatically managed by buf)
- Docker (optional, for hermetic builds)

---

## Quick Start (Local Codegen)

```bash
# Install buf
brew install bufbuild/buf/buf   # macOS
# or see https://docs.buf.build/installation for your platform

# Lint and check for breaking changes
buf lint
buf breaking --against '.git#branch=main'

# Generate stubs to ./gen
buf generate
```

Generated output will appear under `gen/`:
```
gen/
├── go/          # Go stubs
├── ts/          # TypeScript stubs
└── py/          # Python stubs
```

---

## Versioning

- All `.proto` definitions follow **Semantic Versioning**.
- Versions are tagged as `v0.x.y` (e.g., `v0.1.0`).
- Breaking changes increment the **minor** version (`v0.2.0`, etc.).
- Consumers can pin a release by tag or buf module reference:
  ```
  buf.build/driftq-org/driftq-proto:v0.1.0
  ```

---

## Continuous Integration

Each push and pull request runs automated checks:
- `buf lint` — style & correctness
- `buf breaking` — prevent incompatible schema changes
- `buf generate` — ensure generated stubs stay consistent

See `.github/workflows/ci.yml` for details.

---


## License

Licensed under the [Apache License 2.0](./LICENSE).

---
