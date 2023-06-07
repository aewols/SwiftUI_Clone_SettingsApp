//
//  WifiView.swift
//  SettingsApp
//
//  Created by 이연정 on 2023/06/07.
//

import SwiftUI

struct WifiView: View {
    @State var isWified: Bool = true
    
    var body: some View {
        List{
            Section(footer: Text(isWified ? "" : "AirDrop, AirPlay, Notify When Left Behind, and improved location accuracy require Wi-Fi")) {
                Toggle(isOn: $isWified, label: {
                    Text("Wi-Fi")
                })
                .padding(.leading, 26)
                
                if isWified {
                    wifiCell(checkWifi: true, wifiName: "KT-GIGA_2G_Wave_99")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Wi-Fi")
            
            if isWified {
                Section(header: Text("NETWORKS")) {
                    wifiCell(checkWifi: false, wifiName: "KT-GIGA_2G_Wave_99")
                    .padding(.leading, 26)
                    
                    wifiCell(checkWifi: false, wifiName: "KT-GIGA_2G_Wave_99")
                    .padding(.leading, 26)
                    
                    wifiCell(checkWifi: false, wifiName: "KT-GIGA_2G_Wave_99")
                    .padding(.leading, 26)
                    
                    wifiCell(checkWifi: false, wifiName: "KT-GIGA_2G_Wave_99")
                    .padding(.leading, 26)
                    
                    Text("Other...")
                        .padding(.leading, 26)
                }
                
                Section(footer: Text("Known networks will be joined automatically. If no known networks are available, you will be notified of available networks.")) {
                    HStack {
                        NavigationLink {
                            Text("Ask to join Networks")
                        } label: {
                            HStack {
                                Text("Ask to join Networks")
                                Spacer()
                                Text("Notify")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func wifiCell(checkWifi: Bool, wifiName: String) -> some View {
        HStack {
            if checkWifi == true {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }

            Text(wifiName)
            Spacer()
            HStack {
                Image(systemName: "lock.fill")
                Image(systemName: "wifi")
                Image(systemName: "info.circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct WifiView_Previews: PreviewProvider {
    static var previews: some View {
        WifiView()
    }
}
