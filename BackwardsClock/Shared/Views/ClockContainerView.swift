//
//  ClockContainerView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/28.
//

import SwiftUI
import Combine

struct ClockContainerView: View {

    @StateObject private var clockwork: Clockwork = .init()
    
    @State private var isShowingShipQuotePageSheet = false
    
    @State private var isShowingClockQuotePageSheet = false
    
    @State private var isShowingGraceWikiSheet = false
    
    @State private var isShowingSettingSheet = false
    
    private var graceWikiPageURL: String {
        "https://en.wikipedia.org/wiki/Grace_Hopper"
    }
    
    var body: some View {
        VStack {
            
            HStack {
                
                Spacer()
                
                Button {
                    isShowingShipQuotePageSheet.toggle()
                    AnalyticsManager.logShipQuoteButtonDidTap()
                } label: {
                    Text("⛵️")
                }
                .sheet(isPresented: $isShowingShipQuotePageSheet) {
                    ShipQuoteContainerView()
                }

                
                Button {
                    isShowingClockQuotePageSheet.toggle()
                    AnalyticsManager.logCounterClockQuoteButtonDidTap()
                } label: {
                    Image(systemName: SettingBarView.Icon.quotePage.getImageName())
                }
                .sheet(isPresented: $isShowingClockQuotePageSheet) {
                    QuoteMessageContainer()
                }
                
                Button {
                    isShowingGraceWikiSheet.toggle()
                    AnalyticsManager.logGraceHopperWikiPageDidTap()
                } label: {
                    Image(systemName: SettingBarView.Icon.graceWikiProfile.getImageName())
                }
                .sheet(isPresented: $isShowingGraceWikiSheet) {
                    BCWebView(urlString: graceWikiPageURL)
                }

                Button {
                    isShowingSettingSheet.toggle()
                    AnalyticsManager.logSettingPageDidTap()
                } label: {
                    Image(systemName: SettingBarView.Icon.settings.getImageName())
                }
                .fullScreenCover(isPresented: $isShowingSettingSheet) {
                    SettingList()
                }
            }
            .tint(.black)
            .font(.system(size: 50))
            .padding([.leading, .trailing])
            
            DayCalendarView(month: clockwork.month, day: clockwork.day)
                .padding(.bottom, 40)
            
            ZStack {
                ClockDialView()
                HourHandView()
                    .rotationEffect(Angle(radians: clockwork.hourAngle))
                MinuteHandView()
                    .rotationEffect(Angle(radians: clockwork.minuteAngle))
                SecondHandView()
                    .rotationEffect(Angle(radians: clockwork.secondAngle))
            }
            .aspectRatio(1, contentMode: .fit)
            
            Spacer()
            
            Button("Start timer") {
                clockwork.startTimer()
            }
            
            Spacer()
            
            Button("Stop timer") {
                clockwork.stopTimer()
            }
            
            Spacer()
        }
        .background(BCColor.clockContainerBackground)
    }
    
    private func showGraceWikiProfile() {
        isShowingGraceWikiSheet.toggle()
    }
    
    private func showSettingsPage() {
        isShowingGraceWikiSheet.toggle()
    }
}

struct ClockContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockContainerView()
    }
}
