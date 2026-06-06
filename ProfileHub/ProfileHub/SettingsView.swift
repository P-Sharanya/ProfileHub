//
//  SettingsView.swift
//  ProfileHub
//
//  Created by vasantha_m on 06/06/26.
//

import SwiftUI

struct SettingsView: View {
    @State private var isDarkMode = false
    @State private var isNotificationsEnabled = true
    @State private var selectedLanguage = "English"

    let languages = ["English", "Spanish", "French", "German" ]

    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                Toggle(
                    "Dark Mode",
                    isOn: $isDarkMode
                )
            }

            Section(header: Text("Notifications")) {
                Toggle(
                    "Enable Notifications",
                    isOn: $isNotificationsEnabled
                )
            }

            Section(header: Text("Language")) {
                Picker(
                    "Select Language",
                    selection: $selectedLanguage
                ) {
                    ForEach(languages, id: \.self) { language in
                        Text(language)
                    }
                }
            }

            Section {
                Button(action: {}) {
                    Text("Log Out")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Settings")
    }
}
