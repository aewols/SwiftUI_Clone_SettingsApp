//
//  DisplayBrightnessView.swift
//  SettingsApp
//
//  Created by 이연정 on 2023/06/07.
//

import SwiftUI
import UIKit

struct DisplayBrightnessView: View {
    @State private var isAutomatic: Bool = false
    @State private var isBoldText: Bool = false
    @State private var isTrueTone: Bool = false
    @State private var isRaiseToWake: Bool = false
    
    @Binding var brightness: CGFloat
    
    @Environment(\.colorScheme) var colorSchme
    @Binding var isDarkMode: Bool
    
    
    var body: some View {
        List {
            Section(header: Text("APPEARANCE")) {
                HStack {
                    Button {
                        isDarkMode = false
                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = .light
                    } label: {
                        ButtonContent(isSelected: !isDarkMode, imageName: "light", text: "Light")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    
                    Button {
                        isDarkMode = true
                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = .dark
                    } label: {
                        ButtonContent(isSelected: isDarkMode, imageName: "dark", text: "Dark")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.leading, 36)
                }
                 .frame(maxWidth: .infinity)
                
                Toggle(isOn: $isAutomatic, label: {
                    Text("Automatic")
                })
            }
            
            
            Section {
                NavigationLink ("Text Size") {
                    Text("Text Size")
                }
                
                Toggle(isOn: $isBoldText, label: {
                    Text("Bold Text")
                })
            }
            
            
            Section(header: Text("BRIGHTNESS"), footer: Text("Automatically adapt iPhone display based on ambient lighting conditions to make colors appear consistent in different environments")) {
                
                Slider(
                    value: Binding<CGFloat>(
                        get: {
                            self.brightness
                        }, set: { newValue in
                            self.brightness = newValue
                            UIScreen.main.brightness = newValue
                        }
                    ),
                    in: 0...1
                ) {
                    Text("Speed")
                } minimumValueLabel: {
                    Image(systemName: "sun.min.fill")
                        .foregroundColor(.gray)
                } maximumValueLabel: {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.gray)
                }
                
                Toggle(isOn: $isTrueTone, label: {
                    Text("True Tone")
                })
            }
            
            
            Section {
                NavigationLink {
                    Text("Night Shift")
                } label: {
                    HStack {
                        Text("Night Shift")
                        Spacer()
                        Text("Off")
                    }
                }
            }
            
            
            Section {
                NavigationLink {
                    Text("Auto-Lock")
                } label: {
                    HStack {
                        Text("Auto-Lock")
                        Spacer()
                        Text("Never")
                    }
                }
                
                Toggle(isOn: $isRaiseToWake, label: {
                    Text("Raise to Wake")
                })
            }
            
            
            Section(header: Text("DISPLAY"), footer: Text("Choose a view for iPhone. Larger Text shows larger controls. Default shows more content.")) {
                NavigationLink {
                    Text("Display Zoom")
                } label: {
                    HStack {
                        Text("Display Zoom")
                        Spacer()
                        Text("Default")
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Display & Brightness")
    }
}


struct ButtonContent: View {
    @Environment(\.colorScheme) var colorScheme
    var isSelected: Bool
    var imageName: String
    var text: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64)
            
            Text(text)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
            } else {
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .cornerRadius(10)
    }
}
