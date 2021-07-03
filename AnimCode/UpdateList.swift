//
//  UpdateList.swift
//  AnimCode
//
//  Created by Ankit Singh on 23/06/21.
//

import SwiftUI

struct UpdateList: View {
    
    
    
    
    @State var updates = updateData
    
    @ObservableObject var store = UpdateStore(updates: updateData)
    
    
    @State var ShowModalflag : Bool = false
    
    var body: some View {
        NavigationView {
            ListElement(updated: $updates)
                .listStyle(PlainListStyle())
                .navigationTitle("Updates")
                .navigationBarItems(trailing:
                                        Button(action : {
                                            self.ShowModalflag.toggle()
                                            
                                        }) {
                                            Image(systemName : "gear")
                                        }
                    .sheet(isPresented: $ShowModalflag, content: {
                        Text("Hello")
                    })
                )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update : Identifiable {
    var id = UUID()
    var image : String
    var title : String
    var text : String
    var date : String
}


let updateData = [
    
    Update(
        image: "Illustration1",
        title: "SwiftUI",
        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
        date: "JUN 26"),
    
    Update(
        image: "Illustration2",
        title: "Framer X",
        text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
        date: "JUN 11"),
    
    Update(
        image: "Illustration3",
        title: "CSS Layout",
        text: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
        date: "MAY 15"),
    
    Update(
        image: "Certificate1",
        title: "Unity",
        text: "Unity course teaching basics, C# , assets ,level design and gameplay",
        date: "MAR 19"),
    
    Update(
        image: "Certificate2",
        title: "React Native for Designers",
        text: "This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.",
        date: "MAR 19"),
    
    Update(
        image: "Certificate3",
        title: "Vue.js",
        text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,  ",
        date: "MAR 19"),
]

struct ListElement: View {
    
    @Binding var updated : [Update]
    
    
    var body: some View {
        List(updated) { item in
            NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                HStack(spacing : 12) {
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:80,height: 80)
                        .background(Color("background"))
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.text)
                            .lineLimit(2)
                            .lineSpacing(4)
                            .font(.subheadline)
                            .frame(height:50.0)
                        Text(item.date)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.vertical,10)
        }

    }
}
