mod components;
mod pages;

use leptos::*;
use leptos_router::{Router, Routes, Route};
use components::nav::Navbar;
use components::privacy::PrivacyPolicy;
use pages::page404::NotFound;

fn main() {
    leptos::mount_to_body(App);
}

#[component]
fn Test() -> impl IntoView {
    view! {
        <Navbar/>
        <NotFound/>
    }
}

#[component]
fn App() -> impl IntoView {
    view! {
        <Router>
            <Navbar/>
            <main>
            <Routes>
                <Route path="" view=|| view!{<h1>"Hello"</h1>} />
                <Route path="privacy" view=PrivacyPolicy />
                <Route path="*any" view=NotFound />
            </Routes>
            </main>
        </Router>
    }
}

