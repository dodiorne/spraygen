# Security Review

## Summary
This review highlights security concerns identified in `spraygen/generator.py` during a static analysis pass. The tool builds and writes password spraying wordlists and exposes several risks when executed with untrusted input or in shared environments.

## Findings

### 1. Unbounded keyspace expansion can exhaust memory/CPU
`generate_keyspace_list` eagerly materializes every permutation of the selected keyspace using `list(itertools.product(..., repeat=size))`. Because `size` is user-controlled and defaults to `4`, any larger value (e.g., 6–8) will create millions or billions of strings at once, consuming unbounded RAM/CPU and potentially crashing the host (denial of service).【F:spraygen/generator.py†L352-L408】

**Recommendation:** Stream permutations instead of materializing them all at once (iterate directly over the `itertools.product` generator), and enforce a hard maximum on `--size` to bound runtime and memory.

### 2. Module executes generation logic on import
At the bottom of the module, `main()` is executed immediately in a `try/except` block, then redefined and executed again under `if __name__ == "__main__"`. Importing `generator.py` therefore triggers the full CLI workflow, printing progress and reading/writing files unexpectedly—a supply-chain or plugin host could run this by accident and produce side effects or errors before the caller can validate inputs.【F:spraygen/generator.py†L1392-L1403】

**Recommendation:** Remove top-level execution. Keep only the `if __name__ == "__main__": main()` guard so imports are side-effect free, and avoid redefining `main` to prevent confusion.

### 3. Arbitrary file read/write without validation
User-supplied paths for `--wordlist` (`args.w`) and `--output` (`args.o`) are opened directly without sanitization or existence checks. This permits reading or appending to any path the process can access (including following symlinks), enabling information disclosure or clobbering sensitive files if the tool is run with elevated privileges or in multi-tenant environments.【F:spraygen/generator.py†L1190-L1209】【F:spraygen/generator.py†L1372-L1381】

**Recommendation:** Validate paths against an allowed directory, avoid following symlinks, open output files safely (e.g., fail if the target already exists unless explicitly overridden), and handle missing or oversized inputs gracefully.

## Additional Hardening Ideas
* Apply sensible limits to the total number of generated entries (after filters) to mitigate resource exhaustion.
* Prefer `secrets` over `random` if any values are intended to be unpredictable.
* Add unit/integration tests to exercise input validation and denial-of-service controls.
