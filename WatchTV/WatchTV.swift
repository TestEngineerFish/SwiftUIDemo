//
//  WatchTV.swift
//  WatchTV
//
//  Created by 老沙 on 2023/12/8.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        print("==== getSnapshot ====")
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        print("==== getTimeline ====")
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        
        for hourOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let second = Calendar.current.dateComponents([.second], from: entryDate).second ?? 0
            let entry = SimpleEntry(date: entryDate, isFirstImage: second % 2 > 0)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var isFirstImage = true
}

struct WatchTVEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        
        let imageSrc = entry.isFirstImage ? "watch-1" : "watch-2"
        Image(imageSrc)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .onTapGesture {
                // 在轻触事件中执行操作
                print("Widget Tapped!")
            }
    }
}

struct WatchTV: Widget {
    let kind: String = "WatchTV"
    
    var body: some WidgetConfiguration {
        //        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
        //            WatchTVEntryView(entry: entry)
        //                .containerBackground(.fill.tertiary, for: .widget)
        //        }
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WatchTVEntryView(entry: entry)
        }
    }
}

#Preview(as: .systemSmall) {
    WatchTV()
} timeline: {
    SimpleEntry(date: Date())
    SimpleEntry(date: Date())
}
