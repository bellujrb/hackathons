package dev.bellu.hackathon_starthack.navigation

sealed class Landlord(val route: String) {
    data object Home: Landlord(route = "home_landlord")
    data object ViewDirt: Landlord(route = "viewdirt")
    data object Map: Landlord(route = "map")
}