//
//  SettingList.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/6.
//

import SwiftUI

struct SettingList: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var settingListViewModel: SettingListViewModel = .init()
    
    var dismissButton: some View {
        HStack {
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "x.circle")
            }
            .font(.system(size: 40))
            .tint(.black)
            .padding([.trailing, .top])
        }
    }
    
    var body: some View {
        VStack {
            getDismissView()
            getSettingView()
            Spacer()
        }
        .background(Color(uiColor: .systemGroupedBackground))
    }
    
    /// Dismiss, this button will be presented from clock dial view
    @ViewBuilder
    func getDismissView() -> some View {
        HStack {
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "x.circle")
            }
            .font(.system(size: 40))
            .tint(.black)
            .padding([.trailing, .top])
        }
    }
    
    @ViewBuilder
    func getSettingView() -> some View {
        
        NavigationView {
            
                List {
                    Section("About") {
                        NavigationLink("About This App") {
                            AboutPage()
                        }
                    }
                    
                    Section("Style") {
                        NavigationLink("Hands Color Adjust") {
                            HandsColorThemeView()
                        }
                    }
                }
                .navigationTitle("Settings")
        }
        .background(Color(uiColor: .systemGroupedBackground))
    }
}

struct SettingList_Previews: PreviewProvider {
    static var previews: some View {
        SettingList()
    }
}
