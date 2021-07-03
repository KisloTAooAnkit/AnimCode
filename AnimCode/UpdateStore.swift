//
//  UpdateStore.swift
//  AnimCode
//
//  Created by Ankit Singh on 03/07/21.
//

import SwiftUI
import Combine


class UpdateStore : ObservableObject
{
    var didChange = PassthroughSubject<Void , Never>()
    
    var updates : [Update]
    {
        didSet
        {
            didChange.send()
        }
    }
    
    
    init(updates : [Update] = []) {
        self.updates = updates
    }
    
}
