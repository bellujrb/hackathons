package dev.bellu.hackathon_starthack.framework.composables

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import dev.bellu.hackathon_starthack.framework.utils.Colors
import dev.bellu.hackathon_starthack.R
import dev.bellu.hackathon_starthack.framework.utils.TextManager

@Composable
fun RentComposable(
    title: String,
    bio: String,
    price: String,
    category: String,
    onClick: () -> Unit
){
    Box(modifier = Modifier
        .fillMaxWidth()
        .height(300.dp)
        .background(color = Colors.white30),
        content = {
            Column(
                modifier = Modifier.padding(16.dp),
                content = {
                    Image(
                        painter = painterResource(id = R.drawable.dirt_1),
                        modifier = Modifier.fillMaxWidth(),
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
                                    Text(text = title, style = TextManager.smallBlack)
                                    Text(text = bio, style = TextManager.smallGray, modifier = Modifier.offset(y = (-5).dp))
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
                                    Text(category, style = TextManager.smallBlack)
                                }
                            )
                        }
                    )
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween,
                        modifier = Modifier
                            .padding(8.dp)
                            .fillMaxWidth(),
                        content = {
                            Text(text = "CHF $price mouth", style = TextManager.smallBlack)
                            Box(
                                contentAlignment = Alignment.Center,
                                modifier = Modifier
                                    .clickable { onClick() }
                                    .height(30.dp)
                                    .width(95.dp)
                                    .background(
                                        color = Colors.primary,
                                        shape = RoundedCornerShape(8.dp)
                                    ),
                                content = {
                                    Text("RENT", style = TextManager.smallExtraWhite)
                                }
                            )
                        }
                    )
                }
            )
        }
    )
}