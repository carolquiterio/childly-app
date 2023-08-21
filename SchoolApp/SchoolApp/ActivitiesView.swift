//
//  ActivitiesView.swift
//  SchoolApp
//
//  Created by Carol Quiterio on 17/08/23.
//

import SwiftUI

struct ActivitiesView: View {
    @StateObject var activitiesList = ActivityDiaryList()
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
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
                    Text("Menu").font(.system(size: 22, weight: .bold))
                        .padding(.bottom, 16)
                    Spacer()
                }
                HStack {
                    VStack {
                        HStack {
                            Text(activitiesList.data.foodMenu[0].title).font(.system(size: 20, weight: .semibold))
                            Spacer()
                        }
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(activitiesList.data.foodMenu[0].items, id: \.title) { item in
                                foodText(title: item.title, description: item.description)
                            }
                        }
                    }.padding(16)
                        .background(.white)
                        .cornerRadius(10)
                    Spacer()
                    VStack {
                        HStack {
                            Text(activitiesList.data.foodMenu[1].title).font(.system(size: 20, weight: .semibold))
                            Spacer()
                        }
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(activitiesList.data.foodMenu[1].items, id: \.title) { item in
                                foodText(title: item.title, description: item.description)
                            }
                            
                        }
                    }.padding(16)
                        .background(.white)
                        .cornerRadius(10)
                    
                    
                    Spacer()
                }
                HStack {
                    Text("Activities").font(.system(size: 22, weight: .bold))
                        .padding(.bottom, 16)
                    Spacer()
                }.padding(.top, 16)
                ForEach(activitiesList.data.activity, id: \.title) { item in
                    activity(title: item.title, description: item.description, image: item.image)
                }
                
                Spacer()
            }.padding(16)
            
        }
    }
}

func foodText(title: String, description: [String]) -> some View {
    VStack {
        HStack {
            Text(title).font(.system(size: 13, weight: .semibold))
                .foregroundColor(.gray).textCase(.uppercase)
            Spacer()
        }
        ForEach(description, id: \.self) { item in
            HStack {
                Text(item).font(.system(size: 17, weight: .regular))
                Spacer()
            }
        }
    }
}

func activity(title: String, description: String, image: String) -> some View {
    HStack {
        VStack {
            HStack {
                Text(title).font(.system(size: 20, weight: .semibold))
            }
            HStack {
                AsyncImage(url: URL(string: image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(width: 180, height: 140)
                .cornerRadius(16)
            }
        }
        VStack {
            Text(description).font(.system(size: 17, weight: .regular))
        }.padding(.leading, 16)
        Spacer()
    }.padding(16)
        .background(.white)
        .cornerRadius(10)
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}


