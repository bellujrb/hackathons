import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import dev.bellu.hackathon_starthack.framework.screens.WelcomeScreen
import dev.bellu.hackathon_starthack.framework.screens.landlord.HomeLandlordScreen
import dev.bellu.hackathon_starthack.framework.screens.landlord.MapScreen
import dev.bellu.hackathon_starthack.framework.screens.landlord.ViewDirt
import dev.bellu.hackathon_starthack.framework.screens.tenant.CreateAnnounceScreen
import dev.bellu.hackathon_starthack.framework.screens.tenant.HomeTenantScreen
import dev.bellu.hackathon_starthack.framework.screens.tenant.SuccessLandlordScreen
import dev.bellu.hackathon_starthack.navigation.Landlord
import dev.bellu.hackathon_starthack.navigation.Tenant

@Composable
fun AppNavigation(
    navController: NavHostController,
) {
    NavHost(
        navController = navController,
        startDestination = "welcome",
        builder = {
            composable("welcome") { WelcomeScreen(navController)}
            composable(Landlord.Home.route) { HomeLandlordScreen(navController) }
            composable(Landlord.ViewDirt.route) { ViewDirt(navController)}
            composable(Landlord.Map.route) { MapScreen(navController)}

            composable(Tenant.Home.route) { HomeTenantScreen(navController)}
            composable(Tenant.Create.route) { CreateAnnounceScreen(navController)}
            composable(Tenant.Success.route) { SuccessLandlordScreen(navController)}
        }
    )
}