//
//  Student.swift
//  SchoolApp
//
//  Created by Pedro Franco on 17/08/23.
//

import Foundation
import SwiftUI

struct Student {
    var id: UUID = UUID()
    var name: String
    var responsible: [String]
    var adress: String
    var bornDate: Date
    var age: String
    var mainPhone: String
    var otherPhone: String
    var ingressDate: Date
    var foodRestrictions: [String]
    var alergies: [String]
    var bloodType: String
    var preferedHospital: String
    var missingVacines: [String]
    var studentPhoto: UIImage
    var studentDiary: [Date: Diary]
    var studentClass: UUID
}

struct Class {
    var id: UUID = UUID()
    var className: String
    var teachers: [UUID]
    var students: [UUID]
    var shift: String
    var activityDiary: [Date: Diary]
}

struct Diary {
    var id: UUID = UUID()
    var date: Date
    
    var water: DiaryReport = .init(satisfaction: .all, observation: "")
    var milk: DiaryReport = .init(satisfaction: .all, observation: "")
    var fruit: DiaryReport = .init(satisfaction: .all, observation: "")
    var lunch: DiaryReport = .init(satisfaction: .all, observation: "")
    var snackTime: DiaryReport = .init(satisfaction: .all, observation: "")
    
    var attendence: Bool = true
    var attendenceObservation: String
    var completed: Bool = false
    
    struct DiaryReport {
        var satisfaction: Diary.SatisfactionLevel = .all
        var observation: String
        
        init(satisfaction: Diary.SatisfactionLevel, observation: String) {
            self.satisfaction = satisfaction
            self.observation = observation
        }
    }
    
    enum SatisfactionLevel {
        case all
        case half
        case few
        case didNotAccept
        case atHome
    }
}

struct Announcement {
    var title: String
    var description: String
    var photo: UIImage
    var dateEvent: Date
    var writerId: UUID
    var type: Types
    
    enum Types {
        case meetings
        case events
    }
}

struct ActivityDiary {
    var date: Date
    var foodMenu: [FoodMenu]
    var activity: [Activity]
    var classID: UUID
}

struct FoodMenu {
    var title: String
    var portion: String
    var mainPlate: [String]
    var juice: [String]
    var salad: String
    var fruits: [String]
}

struct Activity {
    var title: String
    var description: String
    var image: UIImage
}

