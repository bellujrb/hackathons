package dev.bellu.hackathon_starthack.navigation

sealed class Tenant(val route: String) {
    data object Home: Tenant(route = "home_tenant")
    data object Create: Tenant(route = "create_annuance")
    data object Success: Tenant(route = "success")
}