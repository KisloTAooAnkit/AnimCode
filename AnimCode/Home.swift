//
//  Home.swift
//  AnimCode
//
//  Created by Ankit Singh on 15/06/21.
//

import SwiftUI

struct Home: View {
    
    
    @State var show = false
    
    var body: some View {
        ZStack {
            ZStack(alignment : .topLeading) {
                Button(action: {self.show.toggle()}) {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing,20)
                    .frame(width: 90, height: 60, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0.0, y: 10)
                }
                Spacer()
            }
            ZStack(alignment : .topTrailing) {
                Button(action: {self.show.toggle()}) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.black)
                    }
                    .frame(width: 44, height: 44, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0.0, y: 10)
                }
                Spacer()
            }
            
            
            MenuView(show: $show)
        }
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


struct MenuView: View {
    var menu = menuData
    @Binding var show : Bool
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
        .shadow(radius: 20)
        .rotation3DEffect(
            (Angle(degrees: show ? 0 : 30)),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .animation(.easeIn)
        .offset(x: show ? 0 :-UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}
