//////////////////////////////////////////////////////////////////////////////////
//
//  SYMBIOSE
//  Copyright 2023 Symbiose Technologies, Inc
//  All Rights Reserved.
//
//  NOTICE: This software is proprietary information.
//  Unauthorized use is prohibited.
//
// 
// Created by: Ryan Mckinney on 5/14/23
//
////////////////////////////////////////////////////////////////////////////////

import Foundation
import SwiftUI


public struct AutoAnimateText<E: ATTextAnimateEffect>: View {
    
    @State private var text: String
    
    private let staticTxt: String
    
    private let animationDelay: Double
    private let type: ATUnitType
    private let userInfo: Any?
    private let hAlignment: HorizontalAlignment

    public init(_ text: String,
                type: ATUnitType = .letters,
                userInfo: Any? = nil,
                hAlignment: HorizontalAlignment = .center,
                animationDelay: Double = 0.1) {
        staticTxt = text
        _text = State(initialValue: "")
        self.animationDelay = animationDelay
        self.type = type
        self.userInfo = userInfo
        self.hAlignment = hAlignment
    }

    
    public var body: some View {
//        AnimateText<E>(.constant(staticTxt), type: type, userInfo: userInfo, hAlignment: hAlignment)
//            .opacity(0)
//            .overlay {
//                AnimateText<E>($text, type: type, userInfo: userInfo, hAlignment: hAlignment)
//            }
        AnimateText<E>($text, type: type, userInfo: userInfo, hAlignment: hAlignment)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    text = staticTxt
                }
            }
        
        
    }
}
