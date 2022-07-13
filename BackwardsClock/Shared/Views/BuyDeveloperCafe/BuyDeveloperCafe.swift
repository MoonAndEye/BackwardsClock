//
//  BuyDeveloperCafe.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/9.
//

import SwiftUI

struct BuyDeveloperCafe: View {
    
    @StateObject private var revenuCatAdapter = RevenueCatAdapter()
    
    private var textHint: String {
        if revenuCatAdapter.finishedFetch {
            return "finished: \(String(describing: revenuCatAdapter.fetchedOfferings?.all))"
        } else {
            return "Fetching..."
        }
    }
    
    var body: some View {
        
        ScrollView {
            
            if revenuCatAdapter.finishedFetch {
                createIAPButton()
            }
            
            Text(textHint)
        }
        .onAppear {
            revenuCatAdapter.fetchOfferings()
        }
    }
    
    @ViewBuilder
    private func createIAPButton() -> some View {
        Button("Buy developer a cafe") {
            revenuCatAdapter.purchaseBuyDeveloperACafe()
        }
        .foregroundColor(.red)
    }
}

struct BuyDeveloperCafe_Previews: PreviewProvider {
    static var previews: some View {
        BuyDeveloperCafe()
    }
}
