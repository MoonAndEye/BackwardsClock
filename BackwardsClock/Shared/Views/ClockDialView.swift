//
//  ClockDialView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

struct ClockDialView: View {
    
    var body: some View {
        ZStack {
            ArcView()
                .overlay {
                    GeometryReader { geo in
                        
                        let edge = min(geo.size.width, geo.size.height)
                        
                        Group {
                            ClockTicksView(tickLength: 8)
                                .scaleEffect(1.07)
                            BackwardsClockNumbers()
                        }
                        .frame(width: edge, height: edge, alignment: .center)
                    }
                }
            
        }
    }
}

struct ClockDialView_Previews: PreviewProvider {
    static var previews: some View {
        ClockDialView()
            .previewLayout(.sizeThatFits)
    }
}
