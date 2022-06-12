//
//  AboutPage.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/12.
//

import SwiftUI

struct AboutPage: View {
    var body: some View {
        ScrollView {
            Text("This app inspired from a picture book \"Grace Hopper: Queen of Computer Code\". I want to memory the quote from Grace Hopper")
                .font(.title2)
                .padding(.top, 20)
                .padding()
            LaunchQuoteView()
        }
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage()
    }
}
