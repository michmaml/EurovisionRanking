//
//  EurovisionRankingWidget.swift
//  EurovisionRankingWidget
//
//  Created by Michal Sekulski on 25/07/2023.
//

import WidgetKit
import SwiftUI
import Intents
import EurovisionRankingShared

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct EurovisionRankingWidgetEntryView : View {
    var entry: Provider.Entry
    var song: SongModel = SongModel.data.randomElement()!

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            Link(destination: openIntentInApp(song.videoID)) {
                VStack {
                    Spacer()
                    HeartFlagView(countryName: song.country.lowercased())
                    Text(song.country)
                        .font(.callout)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Check it out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                        .underline()
                }
                .padding()
            }
            .foregroundColor(.white)
            .widgetURL(openIntentInApp(song.videoID))
        }
    }
}

func openIntentInApp(_ videoID: String) -> URL! {
    return URL(string: "eurovisionranking://widget/\(videoID)")
}

struct EurovisionRankingWidget: Widget {
    let kind: String = "EurovisionRankingWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            EurovisionRankingWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct EurovisionRankingWidget_Previews: PreviewProvider {
    static var previews: some View {
        EurovisionRankingWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
