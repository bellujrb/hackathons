package dev.bellu.hackathon_starthack.framework.screens.tenant

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
import androidx.compose.foundation.shape.RoundedCornerShape
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
import dev.bellu.hackathon_starthack.R
import dev.bellu.hackathon_starthack.framework.composables.RentComposable
import dev.bellu.hackathon_starthack.framework.composables.SellComposable
import dev.bellu.hackathon_starthack.framework.utils.Colors
import dev.bellu.hackathon_starthack.framework.utils.TextManager
import dev.bellu.hackathon_starthack.navigation.Landlord
import dev.bellu.hackathon_starthack.navigation.Tenant

@Composable
fun HomeTenantScreen(navController: NavController) {
    Scaffold(
        bottomBar = {
            Box(
                contentAlignment = Alignment.Center,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(114.dp)
                    .background(color = Colors.white),
                content = {
                    Box(
                        contentAlignment = Alignment.Center,
                        modifier = Modifier
                            .clickable { navController.navigate(Tenant.Create.route) }
                            .fillMaxWidth(0.9f)
                            .background(color = Colors.primary, shape = RoundedCornerShape(8.dp))
                            .height(63.dp),
                        content = {
                            Text("Annouce", style = TextManager.smallExtraWhite)
                        }
                    )
                }
            )
        },
        content = { it ->
            Column(
                modifier = Modifier.padding(it),
                content = {
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
                                                            Text(text = "Tenant", style = TextManager.smallWhite)
                                                            Spacer(modifier = Modifier.width(5.dp))
                                                            Icon(imageVector = Icons.Default.ExitToApp, contentDescription = null, modifier = Modifier.clickable { navController.navigate("welcome") })
                                                        }
                                                    )
                                                    Text(text = "St. Gallen City in Switzerland", style = TextManager.smallExtraWhite)
                                                }
                                            )
                                            Image(
                                                painter = painterResource(id = R.drawable.profile_2),
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
                                    SellComposable(
                                        title = "10.000 hectares",
                                        category = "A",
                                    )
                                }
                            )
                        }
                    )
                }
            )

        }
    )
}