package dev.bellu.hackathon_starthack.framework.screens.tenant

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
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
import androidx.compose.material.icons.filled.ArrowBack
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
import dev.bellu.hackathon_starthack.framework.composables.InputSample
import dev.bellu.hackathon_starthack.framework.utils.Colors
import dev.bellu.hackathon_starthack.framework.utils.TextManager
import dev.bellu.hackathon_starthack.navigation.Landlord
import dev.bellu.hackathon_starthack.navigation.Tenant

@Composable
fun CreateAnnounceScreen(navController: NavController){
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
                            .clickable { navController.navigate(Tenant.Success.route) }
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
        content = {
            Column(
                modifier = Modifier.padding(it),
                content = {
                    Column(
                        modifier = Modifier
                            .padding(16.dp),
                        content = {
                            Box(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .height(70.dp),
                                content = {
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        content = {
                                            Icon(
                                                imageVector = Icons.Default.ArrowBack,
                                                modifier = Modifier
                                                    .size(32.dp)
                                                    .clickable { navController.navigate(Tenant.Home.route) },
                                                contentDescription = null
                                            )
                                            Spacer(modifier = Modifier.width(10.dp))
                                            Text("Annuance", style = TextManager.smallBlack)
                                        }
                                    )
                                }
                            )
                            InputSample(placeholder = "Enter number hectares", label = "Hectares")
                            InputSample(placeholder = "Enter your description", label = "Description")
                            InputSample(placeholder = "Enter your date max", label = "Max Date")
                            Box(
                                contentAlignment = Alignment.Center,
                                modifier = Modifier.fillMaxWidth(), content = {
                                    Image(
                                        painter = painterResource(id = R.drawable.upload),
                                        modifier = Modifier.height(164.dp) .width(236.dp),
                                        contentDescription = null
                                    )
                                })
                        }
                    )
                }
            )
        }
    )
}