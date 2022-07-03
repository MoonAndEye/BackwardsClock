//
//  CounterClockwiseQuote.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/3.
//

import SwiftUI

struct CounterClockwiseQuote: View {
    
    @State var quoteTopPadding: CGFloat = 100
    @State var quoteBottomPadding: CGFloat = 150
    @State var quoteOpenImageFont: CGFloat = 50
    @State var clockImageFont: CGFloat = 80
    @State var authorFont: CGFloat = 50
    
    var body: some View {
        
        VStack {
            Text(getQuote())
                .multilineTextAlignment(.center)
                .padding(.top, quoteTopPadding)
                .padding(.bottom, quoteBottomPadding)
                .padding([.leading, .trailing], 20)
                .minimumScaleFactor(0.1)
            .overlay(alignment: .top) {
                Image(systemName: "quote.opening")
                    .font(.system(size: quoteOpenImageFont, weight: .black, design: .default))
                    .offset(y: -25)
            }
            .overlay(alignment: .bottom) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: clockImageFont))
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
Humans are allergic to change.
They love to say, 'We've always done it this way.' I try to fight that.

That's why I have a clock on my wall that runs

counter-clockwise.
"""#
        var attributedString = AttributedString(quote)
        
        let allRange: Range = attributedString.startIndex..<attributedString.endIndex
        attributedString[allRange].font = .system(size: 24)
        
        let rangeItalic = attributedString.range(of: "We've always done it this way.")!
        attributedString[rangeItalic].font = .system(size: 24).italic()
        
        let rangeSemibold = attributedString.range(of: "That's why I have a clock on my wall that runs")!
        attributedString[rangeSemibold].font = .system(size: 24, weight: .semibold, design: .default)
        
        let rangeBold = attributedString.range(of: "counter-clockwise.")!
        attributedString[rangeBold].font = .system(size: 32, weight: .bold, design: .default)
        attributedString[rangeBold].foregroundColor = BCColor.launchCounterClockTextColor
        return attributedString
    }
    
    private func getAuthor() -> String {
        return "Grace Hopper"
    }
}

struct CounterClockwiseQuote_Previews: PreviewProvider {
    static var previews: some View {
        CounterClockwiseQuote()
    }
}
