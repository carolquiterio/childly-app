//
//  ActivitiesView.swift
//  SchoolApp
//
//  Created by Carol Quiterio on 17/08/23.
//

import SwiftUI

struct ActivitiesView: View {
    @StateObject var activitiesList = ActivityDiaryList()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "F3F3F8"), Color(hex: "ECECF9")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Cardápio").font(.system(size: 22, weight: .bold))
                        .padding(.bottom, 16)
                    Spacer()
                }
                HStack {
                    Grid {
                        
                    }
                    
                }
                Spacer()
            }.padding(16)
            
        }
    }
}
    
func foodText(title: String, description: [String]) -> some View {
        VStack {
            Text(title).font(.system(size: 13, weight: .semibold))
                .foregroundColor(.gray).textCase(.uppercase)
            for(item in description) {
                Text(item).font(.system(size: 17, weight: .regular))
            }
        }.padding(.bottom, 16)
    }

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
