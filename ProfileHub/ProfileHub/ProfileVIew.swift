//
//  ContactInfo.swift
//  ProfileHub
//
//  Created by vasantha_m on 06/06/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ProfileHeader()

                StatsSection()

                ActionButtons()

                ContactInformationSection()
            }
        }
    }
}

struct ProfileHeader: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            .blue.opacity(0.7),
                            .purple.opacity(0.7)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 200)

            VStack {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 90, height: 90)
                    )
                    .padding(.top, 40)

                Text("UserName")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Subscribe")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
    }
}

struct StatView: View {
    let number: String
    let title: String

    var body: some View {
        VStack {
            Text(number)
                .font(.title2)
                .fontWeight(.bold)

            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
struct StatsSection: View {
    var body: some View {
        HStack(spacing: 30) {
            StatView(number: "28", title: "Projects")
            StatView(number: "142", title: "Following")
            StatView(number: "847", title: "Followers")
        }
        .padding(.vertical)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .offset(y: -20)
    }
}

struct ActionButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {}) {
                Label("Edit Profile", systemImage: "pencil")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .cornerRadius(25)
            }

            Button(action: {}) {
                Label("Share", systemImage: "square.and.arrow.up")
                    .foregroundColor(.blue)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(25)
            }
        }
        .padding(.bottom)
    }
}
struct ActivityRow: View {
    let icon: String
    let title: String
    let time: String
    let color: Color

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .padding(8)
                .background(
                    Circle()
                        .fill(color.opacity(0.2))
                )

            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.medium)

                Text(time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct ContactInfoRow: View {
    let icon: String
    let title: String
    let detail: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 30)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(detail)
                    .fontWeight(.medium)
            }

            Spacer()
        }
    }
}
struct ContactInformationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Contact Information")
                .font(.headline)
                .padding(.top)

            ContactInfoRow(
                icon: "envelope.fill",
                title: "Email",
                detail: "john.doe@example.com"
            )

            ContactInfoRow(
                icon: "location.fill",
                title: "Location",
                detail: "San Francisco, CA"
            )

            ContactInfoRow(
                icon: "link",
                title: "Website",
                detail: "github.com"
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.ultraThinMaterial)
        )
        .padding()
    }
}
