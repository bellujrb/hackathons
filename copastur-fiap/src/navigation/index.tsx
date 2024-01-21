import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import Welcome from "../screens/welcome";
import Login from "../screens/auth/login";
import Register from "../screens/auth/register";
import Home from "../screens/home";
import Info from "../screens/infos/info1";
import InfoTwo from "../screens/infos/info2";
import Error from "../screens/error404/Error";
import NextTravel from "../screens/nexttravel";
import FlatTravel from "../screens/flattravel";
import CyMain from "../screens/cy/main";
import CyChat from "../screens/cy/chat";
import { AppProvider } from "../context/context";

export type RootStackParams = {
    welcome: undefined;
    login: undefined;
    register: undefined;
    home: undefined;
    info1: undefined;
    info2: undefined;
    error404: undefined;
    nexttravel: undefined;
    flattravel: undefined;
    cymain: undefined;
    cychat: undefined;
}

const Stack = createStackNavigator<RootStackParams>();

export default function Screens(){

    return (
        <AppProvider>
        <NavigationContainer>
            <Stack.Navigator>
                <Stack.Screen
                    name="welcome"
                    component={Welcome}
                    options={{
                        headerShown: false 
                    }}
                />

                <Stack.Screen
                    name="login"
                    component={Login}
                    options={{
                        headerShown: false
                    }}
                />

                <Stack.Screen
                    name="register"
                    component={Register}
                    options={{
                        headerShown: false
                    }}
                />

                <Stack.Screen
                    name="home"
                    component={Home}
                    options={{
                        headerShown: false
                    }}
                />

                <Stack.Screen
                    name="info1"
                    component={Info}
                    options={{
                        headerShown: false
                    }}
                />

                <Stack.Screen
                    name="info2"
                    component={InfoTwo}
                    options={{
                        headerShown: false
                    }}
                />

                <Stack.Screen
                    name="error404"
                    component={Error}
                    options={{
                        headerShown: false
                    }}
                />

                <Stack.Screen
                    name="nexttravel"
                    component={NextTravel}
                    options={{
                        headerShown: false
                    }}
                />

                <Stack.Screen
                    name="flattravel"
                    component={FlatTravel}
                    options={{
                        headerShown: false
                    }}
                />
                <Stack.Screen
                    name="cymain"
                    component={CyMain}
                    options={{
                        headerShown: false
                    }}
                />

                <Stack.Screen
                    name="cychat"
                    component={CyChat}
                    options={{
                        headerShown: false
                    }}
                />
            </Stack.Navigator>
        </NavigationContainer>
        </AppProvider>
    )
}