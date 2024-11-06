mod bindings {
    wit_bindgen::generate!({
        world: "client",
        path: "../../wit",
        with: {
            "{{ namespace }}:{{ package }}/{{ interface }}": generate,
        }
    });
}

fn main() {
    let greeting = bindings::{{ namespace }}::{{ package }}::{{ interface }}::greet("demo");
    println!("{greeting}");
}
