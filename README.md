# Rust Wasm components with wRPC

## Build

```
cargo build --workspace --target wasm32-wasip2 --release
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
