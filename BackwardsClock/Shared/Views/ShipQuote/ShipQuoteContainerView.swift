//
//  ShipQuoteContainerView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/3.
//

import SwiftUI

struct ShipQuoteContainerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var dismissButton: some View {
        return DismissButtonBuilder
            .getDismissButton(action: dismiss, image: Image(systemName: "x.circle"))
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                dismissButton
                    .font(.system(size: 44))
                    .tint(.black)
                    .padding([.top, .trailing])
                
            }
            ShipQuoteView()
            Spacer()
        }
    }
}

struct ShipQuoteContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ShipQuoteContainerView()
    }
}
