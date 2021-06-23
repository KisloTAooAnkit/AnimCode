//
//  UpdateList.swift
//  AnimCode
//
//  Created by Ankit Singh on 23/06/21.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            List(0 ..< 25) { item in
                NavigationLink(destination: Text("1")) {
                    Text("Navigate 1")
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Updates")
            .navigationBarItems(trailing:
                                    Button(action : {
                                        print("hello")
                                        
                                        }) {
                                        Image(systemName : "gear")
                                    }
                                
            )
            
        }
        
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
