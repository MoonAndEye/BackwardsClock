//
//  DismissButtonBuilder.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/6.
//

import SwiftUI

class DismissButtonBuilder {
    
    @ViewBuilder
    static func getDismissButton(action: DismissAction, image: Image) -> some View {
        
        Button {
            action()
        } label: {
            image
        }
        .font(.system(size: 44))
        .tint(.black)
        .padding([.top, .trailing])
    }
}
