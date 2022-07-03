//
//  CounterClockQuote.swift
//  CounterClockQuote
//
//  Created by cm0679 on 2022/7/3.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = [SimpleEntry(date: Date())]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CounterClockQuoteEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CounterClockwiseQuote(
            quoteTopPadding: 10,
            quoteBottomPadding: 10,
            quoteOpenImageFont: 33,
            clockImageFont: 1,
            authorFont: 25)
            .padding()
    }
}

struct ShipStayPortEntryView: View {
    var entry: Provider.Entry
    
    var body: some View {
        ShipQuoteView(
            quoteTopPadding: 10,
            quoteBottomPadding: 10,
            quoteOpenImageFont: 33,
            shipImageFont: 1,
            authorFont: 25)
            .padding()
    }
}

struct CounterClockQuote: Widget {
    let kind: String = "CounterClockQuote"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CounterClockQuoteEntryView(entry: entry)
        }
        .configurationDisplayName("Grace Quotes")
        .description("Counter clock quote")
        .supportedFamilies([.systemLarge, .systemExtraLarge])
    }
}

struct ShipStayPortQuote: Widget {
    let kind: String = "ShipStayPortQuote"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ShipStayPortEntryView(entry: entry)
        }
        .configurationDisplayName("Grace Quotes")
        .description("Sail out to sea quote")
        .supportedFamilies([.systemLarge, .systemExtraLarge])
    }
}

@main
struct WidgetsBudle: WidgetBundle {
    var body: some Widget {
        CounterClockQuote()
        ShipStayPortQuote()
    }
}

struct CounterClockQuote_Previews: PreviewProvider {
    static var previews: some View {
        ShipStayPortEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        CounterClockQuoteEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
