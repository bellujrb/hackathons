package dev.bellu.hackathon_starthack.framework.screens.landlord

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ExitToApp
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import dev.bellu.hackathon_starthack.framework.utils.Colors
import dev.bellu.hackathon_starthack.framework.utils.TextManager
import dev.bellu.hackathon_starthack.R
import dev.bellu.hackathon_starthack.framework.composables.RentComposable
import dev.bellu.hackathon_starthack.navigation.Landlord

@Composable
fun HomeLandlordScreen(navController: NavController){
    Column(
        content = {
            Box(
                modifier = Modifier
                    .height(94.dp)
                    .fillMaxWidth()
                    .background(color = Colors.primary),
                content = {
                    Row(
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier
                            .padding(16.dp)
                            .fillMaxWidth(),
                        content = {
                            Column(
                                content = {
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        content = {
                                            Text(text = "Landlord", style = TextManager.smallWhite)
                                            Spacer(modifier = Modifier.width(5.dp))
                                            Icon(imageVector = Icons.Default.ExitToApp, contentDescription = null, modifier = Modifier.clickable { navController.navigate("welcome") })
                                        }
                                    )
                                    Text(text = "St. Gallen City in Switzerland", style = TextManager.smallExtraWhite)
                                }
                            )
                            Image(
                                painter = painterResource(id = R.drawable.profile_1),
                                modifier = Modifier.size(44.dp),
                                contentDescription = null
                            )
                        }
                    )
                }
            )
            Column(
                modifier = Modifier.padding(24.dp),
                content = {
                    RentComposable(
                        title = "10.000 hectares",
                        bio = "Perfect for Tomate",
                        price = "149",
                        category = "A",
                        onClick = {
                            navController.navigate(Landlord.ViewDirt.route)
                        }
                    )
                }
            )
        }
    )
}