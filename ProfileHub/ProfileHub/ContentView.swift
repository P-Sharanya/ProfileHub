//
//  ContentView.swift
//  ProfileHub
//
//  Created by vasantha_m on 06/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSettings = false
    @State private var showingHelpOptions = false
    @State private var showingProfile = false

    var body: some View {
        NavigationStack {

                ScrollView {
                    VStack(spacing: 25) {

                        NavigationButtons(
                            showingSettings: $showingSettings,
                            showingProfile: $showingProfile,
                            showingHelpOptions: $showingHelpOptions
                        )
                    }
                    .padding()
                }
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                )
            .navigationTitle("Menu")
        }
    }
}

struct NavigationButtons: View {
    @Binding var showingSettings: Bool
    @Binding var showingProfile: Bool
    @Binding var showingHelpOptions: Bool

    var body: some View {
        VStack(spacing: 25) {

            Button(action: {
                showingSettings = true
            }) {
                NavigationButtonContent(
                    icon: "gear",
                    title: "Settings",
                    colors: [.purple, .blue]
                )
            }
            .sheet(isPresented: $showingSettings) {
                NavigationStack {
                    SettingsView()
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Done") {
                                    showingSettings = false
                                }
                            }
                        }
                }
            }

            Button(action: {
                showingProfile = true
            }) {
                NavigationButtonContent(
                    icon: "person.fill",
                    title: "Profile",
                    colors: [.orange, .pink]
                )
            }
            .sheet(isPresented: $showingProfile) {
                NavigationStack {
                    ProfileView()
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Done") {
                                    showingProfile = false
                                }
                            }
                        }
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }

            Button(action: {
                showingHelpOptions = true
            }) {
                NavigationButtonContent(
                    icon: "questionmark.circle",
                    title: "Help",
                    colors: [.green, .teal]
                )
            }
            .confirmationDialog(
                "Help Options",
                isPresented: $showingHelpOptions
            ) {
                Button("FAQ") {}

                Button("Contact Support") {}

                Button("Video Tutorials") {}

                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Choose how you'd like to get help")
            }
        }
    }
}
struct NavigationButtonContent: View {
    let icon: String
    let title: String
    let colors: [Color]

    var body: some View {
        HStack {
            Image(systemName: icon)

            Text(title)

            Spacer()

            Image(systemName: "chevron.right")
        }
        .modifier(
            ModernButtonStyle(
                gradientColors: colors
            )
        )
    }
}
struct ModernButtonStyle: ViewModifier {
    let gradientColors: [Color]

    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            Color.white.opacity(0.2),
                            lineWidth: 1
                        )
                )
            )
            .foregroundColor(.white)
            .cornerRadius(12)
            .shadow(
                color: Color.black.opacity(0.15),
                radius: 5,
                x: 0,
                y: 3
            )
    }
}

#Preview {
    ContentView()
}
