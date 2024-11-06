mod bindings {
    use crate::Handler;

    wit_bindgen::generate!({
        world: "server",
        path: "../../wit",
        with: {
            "{{ namespace }}:{{ package }}/{{ interface }}": generate,
        }
    });
    export!(Handler);
}

struct Handler;

impl bindings::exports::{{ namespace }}::{{ package }}::{{ interface }}::Guest for Handler {
    fn greet(name: String) -> String {
        format!("hello, {name}!")
    }
}
