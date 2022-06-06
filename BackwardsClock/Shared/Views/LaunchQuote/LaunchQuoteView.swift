//
//  LaunchQuoteView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/5.
//

import SwiftUI

struct LaunchQuoteView: View {
    
    var body: some View {
        QuoteMessageView()
            .onAppear {
                switchToMainView()
            }
    }
    
    private func switchToMainView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            Router.shared.currentState = .backwardsClock
        }
    }
}

struct QuoteMessageContainer: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            
        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
                }
                .font(.system(size: 44))
                .tint(.black)
                .padding([.top, .trailing])
                
            }
            QuoteMessageView()
        }
    }
}

struct QuoteMessageView: View {
    
    var body: some View {
        
        VStack {
            Text(getQuote())
                .multilineTextAlignment(.center)
                .padding(.top, 100)
                .padding(.bottom, 150)
                .padding([.leading, .trailing], 20)
            .overlay(alignment: .top) {
                Image(systemName: "quote.opening")
                    .font(.system(size: 50, weight: .black, design: .default))
                    .offset(y: -25)
            }
            .overlay(alignment: .bottom) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 80))
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

struct LaunchQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteMessageView()
        QuoteMessageContainer()
    }
}
