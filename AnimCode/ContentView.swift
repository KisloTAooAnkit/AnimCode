//
//  ContentView.swift
//  AnimCode
//
//  Created by Ankit Singh on 14/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    
    var body: some View {
        ZStack {
            
            BlurView(style: .extraLight)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)

            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(show ? Color.red : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x:0,y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
//                .rotation3DEffect(
//                    Angle(degrees: show ? 50 : 0),
//                    axis: (x:10,y:10,z:10))
                .animation(.easeInOut(duration: 0.7))
                .blendMode(.hardLight)
                .offset(x:viewState.width, y: viewState.height)

            
            CardView()
                
                .background(show ? Color("background5") : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x:0,y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10: 0))
//                .rotation3DEffect(
//                    Angle(degrees: show ? 40 : 0),
//                    axis: (x:10,y:10,z:10))
                .animation(.easeInOut(duration: 0.5))

                .blendMode(.hardLight)
                .offset(x:viewState.width, y: viewState.height)

            
            
            CertificateView()
                .offset(x:viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5:0))
//                .rotation3DEffect(
//                    Angle(degrees: show ? 30 : 0),
//                    axis: (x:10,y:10,z:10))
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ Value in
                            self.viewState = Value.translation
                            self.show = true
                        })
                        .onEnded({ value in
                            self.viewState = CGSize.zero
                            self.show = false
                        })
                
                )
            
        }//zstack
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack{
            Text("Card Back")
        }//vstack
        .frame(width: 340, height: 220)
        
    }
}

struct CertificateView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading)
                {
                    Text("UI Design")
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .font(.headline)
                        .padding(.top)
                    Text("Certificate")
                        .foregroundColor(.white)
                }//Vstack
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }//HStack
            .padding(.horizontal)
            Spacer()
            Image("Background")
        }//Vstack
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(10.0)
        .shadow(radius: 20)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }
        .padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing:20) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(5.0)
                .opacity(0.1)
            Text("This Certificate is a proof that Ankit Has achieved the UI Design Course with full distinction")
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y:600)
    }
}
