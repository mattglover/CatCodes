//
//  Meme.swift
//  ipadcats
//
//  Created by Nick Payne on 30/05/2022.
//

import SwiftUI

struct Meme: View {

    @EnvironmentObject var appPrefs: AppPreferences

    var statusCode = 404
    var animalType = AnimalType.cat

    var body: some View {
        AnimalSwitcher(appPrefs: _appPrefs).padding(.all)
        MyImage(animalType: animalType, statusCode: statusCode).padding(.all)

        HStack {
            ShareButton(statusCode: statusCode, animalType: animalType)
            FavouriteButton(appPrefs: _appPrefs, statusCode: statusCode, animalType: animalType)
        }
        .navigationBarTitle(
            Text("HTTP \(statusCode)")
        )
    }
}

struct Meme_Previews: PreviewProvider {
    static var previews: some View {
        Meme().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
