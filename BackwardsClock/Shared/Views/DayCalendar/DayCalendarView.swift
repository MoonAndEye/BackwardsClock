//
//  DayCalendarView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/3.
//

import SwiftUI

struct DayCalendarView: View {
    
    let month: String
    
    let day: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(BCColor.calendarBackground)
                .cornerRadius(20)
                .padding(10)
            
            CalendarUpperBarContainer(month: month)
            
            GeometryReader { geo in
                Text("\(day)")
                    .font(.system(size: getFontSize(size: geo.size), weight: .bold))
                    .frame(width: geo.size.width, height: geo.size.height * 0.6, alignment: .bottom)
                    .padding(.top, geo.size.height * 0.28)
            }
        }
        .padding()
        .aspectRatio(1.binade, contentMode: .fit)
    }
    
    private func getFontSize(size: CGSize) -> CGFloat {
        
        let shortSide = min(size.width, size.height)
        return shortSide / 2
    }
}

struct DayCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        DayCalendarView(month: "July", day: "4")
            .frame(width: 300, height: 300, alignment: .center)
    }
}
