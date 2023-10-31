// Entrypoint to the website (for now)
// Copyright (C) 2023 Arnav Andrew Jose

// SPDX-License-Identifier: AGPL-3.0-or-later

mod components;
mod pages;

use leptos::*;
use leptos_router::{Router, Routes, Route};
use components::nav::Navbar;
use pages::home::HomePage;
use pages::page404::NotFound;
use pages::privacy::PrivacyPolicy;

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
                <Route path="" view=HomePage />
                <Route path="privacy" view=PrivacyPolicy />
                <Route path="*any" view=NotFound />
            </Routes>
            </main>
        </Router>
    }
}

