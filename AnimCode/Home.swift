//
//  Home.swift
//  AnimCode
//
//  Created by Ankit Singh on 15/06/21.
//

import SwiftUI

struct Home: View {
    
    var menu = menuData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top,20)
        .padding(30)
        .frame(minWidth : 0 , maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing,60)
        .shadow(radius: 20
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My account"
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width :32, height :32)
            Text(text)
                .font(.headline )
            Spacer()
        }
    }
}


struct Menu : Identifiable
{
    var id = UUID()
    var title : String
    var icon : String
    
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "SignOut", icon: "arrow.uturn.down")
    
]