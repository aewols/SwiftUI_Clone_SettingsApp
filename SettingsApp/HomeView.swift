//
//  ContentView.swift
//  SettingsApp
//
//  Created by 이연정 on 2023/06/04.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isDarkMode = false
    @State private var isAirplainModeOn: Bool = false
    
    @State private var brightness: CGFloat = 0.5 {
        didSet {
            UIScreen.main.brightness = brightness
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        profilCell()
                    }
                }
                
                
                Section {
                    navigationLinkCell(imageName: "airpods.gen3",
                              iconBackColor: .white,
                              iconColor: .black,
                              cellTitle: "Aewol의 AirPods #2",
                              subTitle: nil
                    ) {
                        Text("Aewol의 AirPods #2 화면")
                    }
                }
                
                
                Section {
                    toggleCell(imageName: "airplane",
                               iconBackColor: .orange,
                               iconColor: .white,
                               cellTitle: "Airplane Mode",
                               isAirplaneModeOn: $isAirplainModeOn)
                    
                    navigationLinkCell(imageName: "wifi",
                              iconBackColor: .blue,
                              iconColor: .white,
                              cellTitle: "Wi-Fi",
                              subTitle: "KT_GIGA_2G_Wave2"
                    ) {
                        WifiView()
                    }
                    
                    navigationLinkCell(imageName: "",
                              iconBackColor: .blue,
                              iconColor: .white,
                              cellTitle: "Bluetooth",
                              subTitle: "On"
                    ) {
                        Text("Bluetooth 화면")
                    }
                    
                    navigationLinkCell(imageName: "antenna.radiowaves.left.and.right",
                              iconBackColor: .green,
                              iconColor: .white,
                              cellTitle: "Cellular",
                              subTitle: nil
                    ) {
                        Text("Cellular 화면")
                    }
                    
                    navigationLinkCell(imageName: "personalhotspot",
                              iconBackColor: .green,
                              iconColor: .white,
                              cellTitle: "Personal Hotspot",
                              subTitle: "off"
                    ) {
                        Text("Personal Hotspot 화면")
                    }
                }
                
                
                Section {
                    navigationLinkCell(imageName: "bell.badge.fill",
                                       iconBackColor: .red,
                                       iconColor: .white,
                                       cellTitle: "Notifications",
                                       subTitle: nil
                    ) {
                        Text("Notifications 화면")
                    }
                    
                    navigationLinkCell(imageName: "speaker.wave.3.fill",
                                       iconBackColor: .pink,
                                       iconColor: .white,
                                       cellTitle: "Sounds & Haptics",
                                       subTitle: nil
                    ) {
                        Text("Sounds & Haptics 화면")
                    }
                    
                    navigationLinkCell(imageName: "moon.fill",
                                       iconBackColor: .indigo,
                                       iconColor: .white,
                                       cellTitle: "Focus",
                                       subTitle: nil
                    ) {
                        Text("Focus 화면")
                    }
                    
                    navigationLinkCell(imageName: "hourglass",
                                       iconBackColor: .indigo,
                                       iconColor: .white,
                                       cellTitle: "Screen Time",
                                       subTitle: nil
                    ) {
                        Text("Screen Time 화면")
                    }
                }
                
                Section {
                    navigationLinkCell(imageName: "gear",
                                       iconBackColor: .gray,
                                       iconColor: .white,
                                       cellTitle: "General",
                                       subTitle: nil
                    ) {
                        Text("General 화면")
                    }
                    
                    navigationLinkCell(imageName: "switch.2",
                                       iconBackColor: .gray,
                                       iconColor: .white,
                                       cellTitle: "Control Center",
                                       subTitle: nil
                    ) {
                        Text("Control Center 화면")
                    }
                    
                    navigationLinkCell(imageName: "textformat.size",
                                       iconBackColor: .blue,
                                       iconColor: .white,
                                       cellTitle: "Display & Brightness",
                                       subTitle: nil
                    ) {
                        DisplayBrightnessView(brightness: $brightness, isDarkMode: $isDarkMode)
                    }
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
    
    
    @ViewBuilder
    private func profilCell() -> some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .padding(.all, 16)
                .background(.gray)
                .foregroundColor(.white)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Aewol")
                    .font(.system(size: 22))
                    .fontWeight(.regular)
                
                Text("Apple ID, iCloud, Media & Purchases")
                    .font(.system(size: 14))
            }
            .padding(.leading, 8)
        }
    }
    
    
    @ViewBuilder
    private func iconImage(imageName: String, iconBackColor: Color, iconColor: Color) -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 4)
            .background(iconBackColor)
            .foregroundColor(iconColor)
            .cornerRadius(6)
    }
    
    
    @ViewBuilder
    private func toggleCell(imageName: String, iconBackColor: Color, iconColor: Color, cellTitle: String, isAirplaneModeOn: Binding<Bool>) -> some View {
        HStack {
            iconImage(imageName: imageName, iconBackColor: iconBackColor, iconColor: iconColor)
            
            Toggle(cellTitle, isOn: $isAirplainModeOn)
                .padding(.leading, 8)
        }
    }
    
    
    @ViewBuilder
    private func navigationLinkCell<V: View>(imageName: String, iconBackColor: Color, iconColor: Color, cellTitle: String, subTitle: String?, destination: @escaping () -> V) -> some View {
        HStack {
            iconImage(imageName: imageName, iconBackColor: iconBackColor, iconColor: iconColor)
            
            if let subTitle = subTitle {
                NavigationLink {
                    destination()
                } label: {
                    HStack {
                        Text(cellTitle)
                        Spacer()
                        Text(subTitle)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            } else {
                NavigationLink(cellTitle) {
                    destination()
                }
                .padding(.leading, 8)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
