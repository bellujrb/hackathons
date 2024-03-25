package dev.bellu.hackathon_starthack.framework.screens.tenant

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import dev.bellu.hackathon_starthack.framework.utils.Colors
import dev.bellu.hackathon_starthack.framework.utils.TextManager
import dev.bellu.hackathon_starthack.navigation.Tenant
import kotlinx.coroutines.delay

@Composable
fun SuccessLandlordScreen(navController: NavController){
    LaunchedEffect(key1 = null){
        delay(1000)
        navController.navigate(Tenant.Home.route)
    }
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
        modifier = Modifier
            .fillMaxSize()
            .background(color = Colors.primary)
    ) {
        Icon(
            imageVector = Icons.Default.Check,
            modifier = Modifier.size(48.dp),
            contentDescription = null
        )
        Spacer(modifier = Modifier.height(10.dp))
        Box(
            contentAlignment = Alignment.Center,
            modifier = Modifier.fillMaxWidth(),
            content = {
                Text(
                    text = "Land successfully announced",
                    style = TextManager.smallWhite,
                    textAlign = TextAlign.Center
                )
            }
        )
    }
}