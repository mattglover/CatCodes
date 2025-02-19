//
//  SideView.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//

import SwiftUI

struct SidebarView: View {

    @EnvironmentObject var appPrefs: AppPreferences

    var body: some View {
        NavigationStack {
            List {
                Section {
                    AnimalSwitcher(appPrefs: _appPrefs)
                } header: {
                    Text("Meme Type")
                }

                Section {
                    NavigationLink(destination: AllHttpCodes()) {
                        Label("List all HTTP Status Codes", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink(destination: MyFavourites()) {
                        Label("My Favourites", systemImage: "list.star")
                    }
                } header: {
                    Text("My HTTP Codes")
                }

                Section {
                    NavigationLink(destination: RandomCode()) {
                        Label("Pick 1 Random Code", systemImage: "shuffle")
                    }

                    NavigationLink(destination: GridView()) {
                        Label("Show 25 Random Codes", systemImage: "list.bullet.rectangle")
                    }
                } header: {
                    Text("Random Picks")
                }

                Section {
                    NavigationLink(destination: Credits()) {
                        Label("Images", systemImage: "scroll.fill" )
                    }
                } header: {
                    Text("Credits")
                }

            }
            .listStyle(SidebarListStyle())
            .navigationTitle("HTTP Codes")
        }
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject({ () -> AppPreferences in
                let envObj = AppPreferences()
                envObj.animalPreference = .cat
                return envObj
            }() )
    }
}
