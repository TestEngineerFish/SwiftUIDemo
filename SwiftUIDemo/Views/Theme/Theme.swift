//
//  Theme.swift
//  SwiftUIDemo
//
//  Created by 老沙 on 2023/1/4.
//

import Foundation
import SwiftUI

/// 主题调色盘
enum ColorPalette {
    case primary
    case secondary
    case tertiary
    case destructive
    var color: Color {
        switch self {
        case .primary: return Color.orange
        case .secondary: return Color.blue
        case .tertiary: return Color.gray
        case .destructive: return Color.red
        }
    }
}

// 按钮样式类型
enum MimikkoButtonStyle: ButtonStyle {
    case primary
    case secondary
    case destructive
    func makeBody(configuration: Configuration) -> some View {
        switch self {
        case .primary:
            
            configuration
                .label
                .padding(20)
                .foregroundColor(Color.white)
                .background(ColorPalette.secondary.color)
                .cornerRadius(5)
                .opacity(configuration.isPressed ? 0.7 : 1.0)
        case .secondary:
            configuration.label
                .padding(20)
                .border(ColorPalette.primary.color, width: 2.0)
                .foregroundColor(ColorPalette.primary.color)
                .background(Color.white)
                .cornerRadius(5)
                .opacity(configuration.isPressed ? 0.7 : 1.0)
        case .destructive:
            configuration.label
                .padding(20)
                .foregroundColor(Color.white)
                .background(ColorPalette.destructive.color)
                .cornerRadius(5)
                .opacity(configuration.isPressed ? 0.7 : 1.0)
        }
    }
}


// 直接定义主要的按钮样式
struct PrimaryButtonStyle: ButtonStyle {
    var color: Color = ColorPalette.primary.color
    func makeBody(configuration: Configuration) -> some View {
        PrimaryButton(configuration: configuration, color: color)
    }
}

// 主要按钮的配置
struct PrimaryButton: View {
    let configuration: PrimaryButtonStyle.Configuration
    let color: Color
    var body: some View {
        return configuration.label
            .padding(20)
            .foregroundColor(Color.white)
            .background(color)
            .cornerRadius(5)
    }
}
