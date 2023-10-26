mod nav;

use leptos::*;
use nav::Navbar;

fn main() {
    mount_to_body(App)
}

#[component]
fn App() -> impl IntoView {
    let (count, set_count) = create_signal(0);

    view! {
        <Navbar/>
        <button
        on:click=move |_|{set_count.update(|n| *n += 1);}>
        "Click me, Zozo: "
        </button>
        " "<strong class=("red", move || count()%2 == 0)>{count}</strong>
        <br/>
        <button on:click=move |_|(set_count(0))>
        "Reset"
        </button>
    }
}

