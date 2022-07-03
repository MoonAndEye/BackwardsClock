//
//  ShipQuoteView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/21.
//

import SwiftUI

struct ShipQuoteView: View {
    
    @State var quoteTopPadding: CGFloat = 50
    @State var quoteBottomPadding: CGFloat = 100
    @State var quoteOpenImageFont: CGFloat = 50
    @State var shipImageFont: CGFloat = 66
    @State var authorFont: CGFloat = 50
    
    var body: some View {
        
        VStack {
            Text(getQuote())
                .multilineTextAlignment(.center)
                .padding(.top, quoteTopPadding)
                .padding(.bottom, quoteBottomPadding)
                .padding([.leading, .trailing])
            .overlay(alignment: .top) {
                Image(systemName: "quote.opening")
                    .font(.system(size: quoteOpenImageFont, weight: .black, design: .default))
                    .offset(y: -25)
            }
            .overlay(alignment: .bottom) {
                Text("⛵️")
                    .font(.system(size: shipImageFont))
                    .minimumScaleFactor(0.2)
                    .offset(y: -20)
            }
            .background(BCColor.launchQuoteRectBackground)
            .padding()
            
            HStack {
                Text("- \(getAuthor()) -")
                    .lineLimit(1)
                    .font(.custom("SnellRoundhand-Black", size: authorFont))
                    .minimumScaleFactor(0.2)
            }
            .padding(.top)
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
    }
}
