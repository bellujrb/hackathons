package dev.bellu.hackathon_starthack.framework.screens

import dev.bellu.hackathon_starthack.framework.utils.Colors
import dev.bellu.hackathon_starthack.framework.utils.TextManager
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Build
import androidx.compose.material.icons.filled.Edit
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import dev.bellu.hackathon_starthack.R
import dev.bellu.hackathon_starthack.navigation.Landlord
import dev.bellu.hackathon_starthack.navigation.Tenant

@Composable
fun WelcomeScreen(navController: NavController){
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier.padding(16.dp),
        content = {
            Box(
                contentAlignment = Alignment.Center,
                modifier = Modifier
                    .height(118.dp)
                    .fillMaxSize(),
                content = {
                    Image(
                        painter = painterResource(id = R.drawable.logo),
                        modifier = Modifier
                            .height(80.dp)
                            .width(184.4.dp),
                        contentDescription = "Logo"
                    )
                },
            )
            Spacer(modifier = Modifier.height(10.dp))
            Text(
                text = "Enter Now",
                style = TextManager.bigBlack,
                textAlign = TextAlign.Center
            )
            Spacer(modifier = Modifier.height(10.dp))
            Box(
                modifier = Modifier
                    .height(150.dp)
                    .fillMaxWidth(1.0f)
                    .background(color = Colors.white30)
                    .clickable {
                        navController.navigate(Landlord.Home.route)
                    },
                content = {
                    Column(
                        verticalArrangement = Arrangement.SpaceBetween,
                        modifier = Modifier
                            .fillMaxSize(),
                        content = {
                            Column(
                                modifier = Modifier
                                    .padding(12.dp)
                            ) {
                                Box(
                                    contentAlignment = Alignment.Center,
                                    modifier = Modifier
                                        .size(56.dp)
                                        .background(color = Colors.white),
                                    content = {
                                        Icon(
                                            modifier = Modifier
                                                .size(24.dp),
                                            imageVector = Icons.Default.Edit,
                                            contentDescription = null
                                        )
                                    }
                                )
                                Spacer(modifier = Modifier.height(10.dp))
                                Text(
                                    text = "Landlord",
                                    style = TextManager.smallBlack
                                )
                                Spacer(modifier = Modifier.height(10.dp))
                                Text(
                                    text = "Sign in as a landlord and acquire for rent\n",
                                    style = TextManager.smallGray
                                )
                            }
                            Box(modifier = Modifier
                                .height(2.dp)
                                .fillMaxWidth()
                                .background(color = Colors.primary)
                            )
                        }
                    )
                },
            )
            Spacer(modifier = Modifier.height(10.dp))
            Box(
                modifier = Modifier
                    .clickable { navController.navigate(Tenant.Home.route) }
                    .height(180.dp)
                    .fillMaxWidth(1.0f)
                    .background(color = Colors.white30),
                content = {
                    Column(
                        verticalArrangement = Arrangement.SpaceBetween,
                        modifier = Modifier
                            .fillMaxSize(),
                        content = {
                            Column(
                                modifier = Modifier
                                    .padding(12.dp)
                            ) {
                                Box(
                                    contentAlignment = Alignment.Center,
                                    modifier = Modifier
                                        .size(56.dp)
                                        .background(color = Colors.white),
                                    content = {
                                        Icon(
                                            modifier = Modifier
                                                .size(24.dp),
                                            imageVector = Icons.Default.Build,
                                            contentDescription = null
                                        )
                                    }
                                )
                                Spacer(modifier = Modifier.height(10.dp))
                                Text(
                                    text = "Tenant",
                                    style = TextManager.smallBlack
                                )
                                Spacer(modifier = Modifier.height(10.dp))
                                Text(
                                    text = "Enter as a tenant and rent your land to take care of it and generate income",
                                    style = TextManager.smallGray
                                )
                            }
                            Box(modifier = Modifier
                                .height(2.dp)
                                .fillMaxWidth()
                                .background(color = Colors.primary)
                            )
                        }
                    )
                },
            )}
    )
}