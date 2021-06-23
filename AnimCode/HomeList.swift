//
//  HomeList.swift
//  AnimCode
//
//  Created by Ankit Singh on 19/06/21.
//

import SwiftUI

struct HomeList: View {
    var courses = courseData
    @State var showModelView: Bool = false
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment:.leading) {
                    Text("Courses")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("22 Courses")
                        .foregroundColor(.gray)
                    
                }
                Spacer()
            }
            .padding(.leading, 70.0)
            .padding(.bottom,40)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing:30) {
                    ForEach(courses) { item in
                        CourseView(
                            title: item.title,
                            image: item.image,
                            color: item.color,
                            shadowColor: item.shadowColor
                        )
                        //.padding(.vertical,50)
                        .onTapGesture {
                            self.showModelView.toggle()
                        }
                        .sheet(isPresented: $showModelView, content: {
                            ContentView()
                        })
                        
                        
                    }
                    
                }
                .padding(.leading,40)
                
            }
            )
            Spacer()
        }
        .padding(.top, 78.0)
        //.ignoresSafeArea()
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    
    var title = "Build an app with Swift UI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing,50)
            Spacer()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom,30)
            
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color:shadowColor, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
    }
}


struct Course : Identifiable
{
    var id = UUID()
    var title : String
    var image : String
    var color : Color
    var shadowColor : Color
}


let courseData = [
    
    Course(
        title: "Build an app using SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Design Course",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    )
    
]
