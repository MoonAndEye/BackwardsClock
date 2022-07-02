//
//  ShipQuoteView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/21.
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

struct ShipQuoteView: View {
    
    var body: some View {
        
        VStack {
            Text(getQuote())
                .multilineTextAlignment(.center)
                .padding(.top, 50)
                .padding(.bottom, 100)
                .padding([.leading, .trailing], 20)
            .overlay(alignment: .top) {
                Image(systemName: "quote.opening")
                    .font(.system(size: 50, weight: .black, design: .default))
                    .offset(y: -25)
            }
            .overlay(alignment: .bottom) {
                Text("⛵️")
                    .font(.system(size: 66))
                    .minimumScaleFactor(0.2)
                    .offset(y: -20)
            }
            .background(BCColor.launchQuoteRectBackground)
            .padding()
            
            HStack {
                Text("- \(getAuthor()) -")
                    .lineLimit(1)
                    .font(.custom("SnellRoundhand-Black", size: 50))
                    .minimumScaleFactor(0.2)
            }
            .padding(.top, 50)
            .padding([.leading, .trailing])
            
        }
    }
    
    private func getQuote() -> AttributedString {
        
        let quote =  #"""
A ship in port is safe, but that is not what ships are built for.

Sail out to sea and do new things.
"""#
        
        var attributedString = AttributedString(quote)
        
        let allRange: Range = attributedString.startIndex..<attributedString.endIndex
        attributedString[allRange].font = .system(size: 24)
        
        let rangeSemibold = attributedString.range(of: "Sail out to sea and do new things.")!
        attributedString[rangeSemibold].font = .system(size: 24, weight: .semibold, design: .default)
        
        return attributedString
    }
    
    private func getAuthor() -> String {
        return "Grace Hopper"
    }
}

struct ShipQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        ShipQuoteView()
        ShipQuoteContainerView()
    }
}
