import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .foregroundColor(Color("buttonColor"))
                    Text("Home")
                    
                }
            
            MyExploreView()
                .tabItem {
                    Image(systemName: "location")
                    Text("Explore")
                }
            
            BookingView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Booking")
                }
            
            MyProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }.accentColor(Color("buttonColor"))
            .opacity(1)
    }
}

// Placeholder views for other tabs
struct MyExploreView: View {
    var body: some View {
     ExploreView()
    }
}

struct BookingView: View {
    var body: some View {
       MyBookingView()
    }
}

struct MyProfileView: View {
    var body: some View {
       ProfileView()
    }
}

#Preview {
    TabBar()
}

