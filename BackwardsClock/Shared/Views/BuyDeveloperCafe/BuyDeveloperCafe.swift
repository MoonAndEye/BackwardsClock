//
//  BuyDeveloperCafe.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/9.
//

import SwiftUI

struct BuyDeveloperCafe: View {
    
    @StateObject private var revenuCatAdapter = RevenueCatAdapter.shared
    
    private var textHint: String {
        if revenuCatAdapter.finishedFetch {
            return "finished: \(String(describing: revenuCatAdapter.fetchedOfferings?.all))"
        } else {
            return "Fetching..."
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            if revenuCatAdapter.finishedFetch {
                createVIPorIAPView()
            } else {
                Text("Fetching...")
                    .font(.system(size: 25, weight: .medium))
            }
            Spacer()
        }
        .onAppear {
            revenuCatAdapter.fetchOfferings()
            revenuCatAdapter.getCustomerInfo()
        }
    }
    
    @ViewBuilder
    private func createVIPorIAPView() -> some View {
        if revenuCatAdapter.isVIP {
            VStack {
                createThanksBanner()
                VIPBannerView()
            }
        } else {
            createIAPButton()
        }
    }
    
    @ViewBuilder
    private func createIAPButton() -> some View {
        Button("Buy developer a cafe") {
            revenuCatAdapter.purchaseBuyDeveloperACafe()
        }
        .font(.system(size: 25, weight: .medium))
        .foregroundColor(BCColor.cupColor)
    }
    
    @ViewBuilder
    private func createThanksBanner() -> some View {
        HStack {
            
            createCoffe()
                .padding(.leading)
            createCoffe()
            Text("Thanks for cafe")
                .lineLimit(1)
                .minimumScaleFactor(0.2)
            createCoffe()
            createCoffe()
                .padding(.trailing)
        }
    }
    
    @ViewBuilder
    private func createCoffe() -> some View {
        Image(systemName: "cup.and.saucer.fill")
            .font(.system(size: 25))
            .foregroundColor(BCColor.cupColor)
    }
}

struct BuyDeveloperCafe_Previews: PreviewProvider {
    static var previews: some View {
//        BuyDeveloperCafe()
        ThanksView()
    }
}

extension BuyDeveloperCafe_Previews {
    
    struct ThanksView: View {
        var body: some View {
            HStack {
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 25))
                    .foregroundColor(BCColor.cupColor)
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 25))
                    .foregroundColor(BCColor.cupColor)
                Text("Thanks for cafe")
                    .font(.body)
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 25))
                    .foregroundColor(BCColor.cupColor)
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 25))
                    .foregroundColor(BCColor.cupColor)
            }
        }
    }
}
