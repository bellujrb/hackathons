package dev.bellu.hackathon_starthack.framework.screens.landlord

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import dev.bellu.hackathon_starthack.R
import dev.bellu.hackathon_starthack.navigation.Landlord
import kotlinx.coroutines.delay

@Composable
fun MapScreen(navController: NavController){

    LaunchedEffect(key1 = null){
        delay(2000)

        navController.navigate(Landlord.Home.route)
    }
    Column(
        modifier = Modifier.fillMaxSize(),
        content = {
            Image(
                painter = painterResource(id = R.drawable.smartselect_20240321_174205_samsung_notes),
                modifier = Modifier.fillMaxSize(),
                contentDescription = null
            )
        }
    )
}