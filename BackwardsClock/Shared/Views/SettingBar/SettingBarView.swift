//
//  SettingBarView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/6.
//

import SwiftUI

extension SettingBarView {
    enum Icon {
        case graceWikiProfile
        case settings
        
        func getImageName() -> String {
            switch self {
            case .graceWikiProfile:
                return "person.crop.circle"
            case .settings:
                return "gearshape.circle"
            }
        }
    }
}

struct SettingBarView: View {
    
    var graceProfileTapHandler: (() -> Void)?
    
    var gearshapeTapHandler: (() -> Void)?
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Button {
                print("person.crop.circle, did tap")
                graceProfileTapHandler?()
            } label: {
                Image(systemName: Icon.graceWikiProfile.getImageName())
            }

            Button {
                print("gearshape, did tap")
                gearshapeTapHandler?()
            } label: {
                Image(systemName: Icon.settings.getImageName())
            }
        }
        .tint(.black)
        .font(.system(size: 50))
        .padding([.leading, .trailing])
    }
}

struct SettingBarView_Previews: PreviewProvider {
    static var previews: some View {
        SettingBarView {
            print("foo")
        } gearshapeTapHandler: {
            print("bar")
        }

    }
}
