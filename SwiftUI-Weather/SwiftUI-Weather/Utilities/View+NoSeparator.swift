//
//  View+NoSeparator.swift
//  SwiftUI-Weather
//
//  Created by Fuh chang Loi on 21/5/21.
//

import SwiftUI

extension View {
  @ViewBuilder public func noSeparators(
    edgeInsets: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
    color: Color
  ) -> some View {
        self
        .padding(edgeInsets)
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 44,
          alignment: .leading
        )
        .listRowInsets(EdgeInsets())
        .background(color)
    }
}
