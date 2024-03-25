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
import androidx.compose.foundation.layout.offset
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
import dev.bellu.hackathon_starthack.framework.utils.Colors
import dev.bellu.hackathon_starthack.framework.utils.TextManager
import dev.bellu.hackathon_starthack.navigation.Landlord

@Composable
fun ViewDirt(navController: NavController){
    Column(
        modifier = Modifier.padding(16.dp),
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
                                    .clickable { navController.navigate(Landlord.Home.route) },
                                contentDescription = null
                            )
                            Spacer(modifier = Modifier.width(10.dp))
                            Text("Detail", style = TextManager.smallBlack)
                        }
                    )
                }
            )
            Spacer(modifier = Modifier.height(10.dp))
            Image(
                painter = painterResource(id = R.drawable.dirt_1),
                modifier = Modifier
                    .fillMaxWidth()
                    .height(212.dp),
                contentDescription = null
            )
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier
                    .padding(8.dp)
                    .fillMaxWidth(),
                content = {
                    Column(
                        content = {
                            Text(text = "10.000 hectares", style = TextManager.smallBlack)
                            Text(text = "Perfect for Tomate", style = TextManager.smallGray, modifier = Modifier.offset(y = (-5).dp))
                        }
                    )
                    Box(
                        contentAlignment = Alignment.Center,
                        modifier = Modifier
                            .height(30.dp)
                            .width(64.dp)
                            .background(
                                color = Colors.onTertiary,
                                shape = RoundedCornerShape(8.dp)
                            ),
                        content = {
                            Text("A", style = TextManager.smallBlack)
                        }
                    )
                }
            )
            Spacer(modifier = Modifier
                .fillMaxWidth()
                .height(2.dp)
                .background(color = Colors.secondary))
            Spacer(modifier = Modifier.height(10.dp))
            Column(
                modifier = Modifier
                    .padding(8.dp),
                content = {
                    Text(text = "Description", style = TextManager.smallBlack)
                    Text(text = "Terra em bom estado e conservado com o tamanho de 10.000 hectares.", style = TextManager.smallGray, modifier = Modifier.offset(y = (-5).dp))
                }
            )
            Column(
                modifier = Modifier
                    .padding(8.dp),
                content = {
                    Text(text = "Mouth", style = TextManager.smallBlack)
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween,
                        modifier = Modifier.fillMaxWidth(),
                        content = {
                            Box(
                                contentAlignment = Alignment.Center,
                                modifier = Modifier
                                    .height(43.dp)
                                    .width(96.dp)
                                    .background(
                                        color = Colors.onSecondary,
                                        shape = RoundedCornerShape(8.dp)
                                    ),
                                content = {
                                    Text("1", style = TextManager.smallBlack)
                                }
                            )
                            Box(
                                contentAlignment = Alignment.Center,
                                modifier = Modifier
                                    .height(43.dp)
                                    .width(96.dp)
                                    .background(
                                        color = Colors.onSecondary,
                                        shape = RoundedCornerShape(8.dp)
                                    ),
                                content = {
                                    Text("3", style = TextManager.smallBlack)
                                }
                            )
                            Box(
                                contentAlignment = Alignment.Center,
                                modifier = Modifier
                                    .height(43.dp)
                                    .width(96.dp)
                                    .background(
                                        color = Colors.onSecondary,
                                        shape = RoundedCornerShape(8.dp)
                                    ),
                                content = {
                                    Text("6", style = TextManager.smallBlack)
                                }
                            )
                        }
                    )
                    Spacer(modifier = Modifier.height(10.dp))
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween,
                        modifier = Modifier
                            .padding(8.dp)
                            .fillMaxWidth(),
                        content = {
                            Text(text = "CHF 149 mouth", style = TextManager.smallBlack)
                            Box(
                                contentAlignment = Alignment.Center,
                                modifier = Modifier
                                    .clickable { navController.navigate(Landlord.Map.route) }
                                    .height(30.dp)
                                    .width(95.dp)
                                    .background(
                                        color = Colors.primary,
                                        shape = RoundedCornerShape(8.dp)
                                    ),
                                content = {
                                    Text("PAY", style = TextManager.smallExtraWhite)
                                }
                            )
                        }
                    )
                }
            )
        }
    )
}