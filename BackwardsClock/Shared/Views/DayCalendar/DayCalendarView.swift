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
            ZStack(alignment: .top) {
                CalendarUpperBarV2()
                    .fill(.red)
                Text("\(month)")
                    .font(.system(size: 30, weight: .medium, design: .monospaced))
                    .padding(.top, 20)
                    .foregroundColor(.white)
            }
            Text("\(day)")
                .font(.system(size: 150, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding(.top, 50)
        }
        .padding()
        .aspectRatio(1.binade, contentMode: .fit)
    }
}

struct DayCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        DayCalendarView(month: "July", day: "4")
    }
}
