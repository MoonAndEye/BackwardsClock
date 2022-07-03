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
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

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

@main
struct CounterClockQuote: Widget {
    let kind: String = "CounterClockQuote"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CounterClockQuoteEntryView(entry: entry)
        }
        .configurationDisplayName("Quotes")
        .description("Quotes from Grace Hopper")
        .supportedFamilies([.systemLarge, .systemExtraLarge])
    }
}

struct CounterClockQuote_Previews: PreviewProvider {
    static var previews: some View {
        CounterClockQuoteEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
