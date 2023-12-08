//
//  ProfilesHost.swift
//  SwiftUIDemo
//
//  Created by sam on 2022/9/5.
//

import SwiftUI

struct ProfilesHost: View {
    
    @Environment(\.editMode) var editModel
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editModel?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editModel?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editModel?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }.id("test")
            }
        }
        .padding()
        .foregroundColor(.red)
        .background(.regularMaterial)
    }
    
    var cView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 20))
        return view
    }()
}

struct ProfilesHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesHost().environmentObject(ModelData())
    }
}
