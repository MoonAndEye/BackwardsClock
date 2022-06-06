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
            dismissButton
            Text("This is setting list")
        }
    }
}

struct SettingList_Previews: PreviewProvider {
    static var previews: some View {
        SettingList()
    }
}
