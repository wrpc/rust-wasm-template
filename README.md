# Rust Wasm components with wRPC

## Build

With `cargo`:
```
cargo build --workspace --target wasm32-wasip2 --release
```

With `nix`:
```
nix build .#{{ project-name }}-wasm32-wasip2
```

## Run

### Server

```
wrpc-wasmtime tcp serve ./target/wasm32-wasip2/release/server.wasm 
```

### Client

```
wrpc-wasmtime tcp run ./target/wasm32-wasip2/release/client.wasm 
```
