//
//  SettingBarView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/6.
//

import SwiftUI

extension SettingBarView {
    enum Icon {
        case quotePage
        case graceWikiProfile
        case settings
        
        func getImageName() -> String {
            switch self {
            case .quotePage:
                return "quote.bubble"
            case .graceWikiProfile:
                return "person.crop.circle"
            case .settings:
                return "gearshape.circle"
            }
        }
    }
}
// TODO: - This view can be refactor later. Currently, just use view can done the jobs. Need research SwiftUI Binding mechanism
struct SettingBarView: View {
    
    var quotePageTapHandler: (() -> Void)?
    
    var graceProfileTapHandler: (() -> Void)?
    
    var gearshapeTapHandler: (() -> Void)?
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Button {
                quotePageTapHandler?()
            } label: {
                Image(systemName: Icon.quotePage.getImageName())
            }
            
            Button {
                graceProfileTapHandler?()
            } label: {
                Image(systemName: Icon.graceWikiProfile.getImageName())
            }

            Button {
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
