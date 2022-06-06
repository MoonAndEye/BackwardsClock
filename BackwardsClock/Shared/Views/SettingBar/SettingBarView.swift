//
//  SettingBarView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/6.
//

import SwiftUI

struct SettingBarView: View {
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Button {
                print("person.crop.circle, did tap")
            } label: {
                Image(systemName: "person.crop.circle")
                    .tint(.black)
            }

            Button {
                print("gearshape, did tap")
            } label: {
                Image(systemName: "gearshape.circle.fill")
                    .tint(.black)
            }
        }
        .font(.system(size: 50))
        .padding([.leading, .trailing])
    }
}

struct SettingBarView_Previews: PreviewProvider {
    static var previews: some View {
        SettingBarView()
    }
}
