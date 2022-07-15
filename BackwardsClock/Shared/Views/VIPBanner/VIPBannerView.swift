//
//  VIPBannerView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/15.
//

import SwiftUI

struct VIPBannerView: View {
    var body: some View {
        HStack {
            Image(systemName: "cup.and.saucer.fill")
                .font(.system(size: 25))
                .foregroundColor(BCColor.cupColor)
            Text("VIP")
                .font(.system(size: 25, weight: .semibold, design: .default))
                .padding([.leading, .trailing], 25)
            Image(systemName: "cup.and.saucer.fill")
                .font(.system(size: 25))
                .foregroundColor(BCColor.cupColor)
        }
    }
}

struct VIPBannerView_Previews: PreviewProvider {
    static var previews: some View {
        VIPBannerView()
            .previewLayout(.sizeThatFits)
    }
}
