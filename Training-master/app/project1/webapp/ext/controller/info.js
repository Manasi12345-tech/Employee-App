 //checking if the app is on application or launchpad via isNavigationSupported
// sap.ushell.Container.getService("CrossApplicationNavigation").isNavigationSupported()

// manifest:
// "crossnavigation": {
//     "inbounds": {//similarly can have outbound
//         "intent1": {
//             "signature": {
//                 "parameters": {
//                     "param1": {
//                         "required": true
//                     }
//                 }
//             }
//         }
//     }
// }
//annotations based:
//DataFieldWithIntentBasedNavigation