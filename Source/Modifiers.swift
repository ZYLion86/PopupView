//
//  Constructors.swift
//  Pods
//
//  Created by Alisa Mylnikova on 11.10.2022.
//

import SwiftUI

extension View {

    public func popup<PopupContent: View, JMBackground: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder view: @escaping () -> PopupContent,
        customize: @escaping (Popup<Int, PopupContent, JMBackground>.PopupParameters) -> Popup<Int, PopupContent, JMBackground>.PopupParameters
        ) -> some View {
            self.modifier(
                FullscreenPopup<Int, PopupContent, JMBackground>(
                    isPresented: isPresented,
                    isBoolMode: true,
                    params: customize(Popup<Int, PopupContent, JMBackground>.PopupParameters()),
                    view: view)
            )
        }

    public func popup<Item: Equatable, PopupContent: View, JMBackground: View>(
        item: Binding<Item?>,
        customize: @escaping (Popup<Item, PopupContent, JMBackground>.PopupParameters) -> Popup<Item, PopupContent, JMBackground>.PopupParameters,
        @ViewBuilder view: @escaping () -> PopupContent) -> some View {
            self.modifier(
                FullscreenPopup<Item, PopupContent, JMBackground>(
                    item: item,
                    isBoolMode: false,
                    params: customize(Popup<Item, PopupContent, JMBackground>.PopupParameters()),
                    view: view)
            )
        }
}
