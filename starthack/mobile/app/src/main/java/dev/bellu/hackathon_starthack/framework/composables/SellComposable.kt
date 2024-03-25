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
fun SellComposable(
    title: String,
    category: String,
){
    Box(modifier = Modifier
        .fillMaxWidth()
        .height(240.dp)
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
                                    Text(text = "10.000 hectares", style = TextManager.smallBlack)
                                        Text(text = "Rented until 06/21/2024", style = TextManager.smallGray)
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
                }
            )
        }
    )
}