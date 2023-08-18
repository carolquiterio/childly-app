//
// Student.swift
// SchoolApp
//
// Created by Pedro Franco on 17/08/23.
//

import Foundation
import SwiftUI

struct Student: Identifiable {
  var id: UUID = UUID()
  var name: String
  var responsible: [String]
  var address: String
  var bornDate: Date
  var age: String
  var mainPhone: String
  var otherPhone: String
  var ingressDate: Date
  var foodRestrictions: [String]
  var allergies: [String]
  var bloodType: String
  var preferredHospital: String
  var missingVacines: [String]
  var studentPhoto: UIImage
  var studentDiary: [Date: Diary]
  var studentClass: UUID
}

class StudentList: ObservableObject {
  @Published var studentList: [Student]
   
  init(studentList: [Student]) {
    self.studentList = [
      Student(
        id: UUID(),
        name: "John Doe",
        responsible: ["Parent 1", "Parent 2"],
        address: "123 Main Street, City",
        bornDate: Date(),
        age: "18",
        mainPhone: "123-456-7890",
        otherPhone: "987-654-3210",
        ingressDate: Date(),
        foodRestrictions: ["No nuts", "Gluten-free"],
        allergies: ["Pollen", "Cats"],
        bloodType: "A+",
        preferredHospital: "City General Hospital",
        missingVacines: ["Flu", "HPV"],
        studentPhoto: UIImage(),
        studentDiary: [:],
        studentClass: UUID()
      )
    ]
  }
}

struct Class {
  var id: UUID = UUID()
  var className: String
  var teachers: [UUID]
  var students: [UUID]
  var shift: String
  var activityDiary: [Date: Diary]
}

class ClassList: ObservableObject {
  @Published var classList: [Class]
   
  init(classList: [Class]) {
    self.classList = [
      Class(
        className: "Math 101",
        teachers: [UUID()],
        students: [UUID()],
        shift: "Morning",
        activityDiary: [:]
      )
    ]
  }
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

struct Announcement: Identifiable {
  var id = UUID()
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

class AnnouncementList: ObservableObject {
  @Published var data: [Announcement] = [
    Announcement(
      title: "Important Meeting",
      description: "There will be an important meeting tomorrow.",
      photo: UIImage(),
      dateEvent: Date(),
      writerId: UUID(),
      type: .meetings
    ),
    Announcement(
      title: "Annual School Event",
      description: "Our annual school event is coming up!",
      photo: UIImage(),
      dateEvent: Date(),
      writerId: UUID(),
      type: .events
    )
  ]
}


struct ActivityDiary: Identifiable {
  var id: UUID
  var date: Date
  var foodMenu: [FoodMenu]
  var activity: [Activity]
  var classID: UUID
}

class ActivityDiaryList: ObservableObject {
  @Published var data: ActivityDiary =
    ActivityDiary(
      id: UUID(),
      date: Date(),
      foodMenu: [
        FoodMenu(
          id: UUID(),
          title: "Breakfast",
          portion: ("Portion", ["Rice and beans"]),
          mainPlate: ("Main Plate", ["Scrambled Eggs", "Toast"]),
          juice: ("Juice", ["Orange Juice"]),
          salad: ("Salad", ["Mixed Greens"]),
          fruits: ("Fruit", ["Apple"])
        ),
        FoodMenu(
          id: UUID(),
          title: "Lunch",
          portion: ("Portion", ["1 serving"]),
          mainPlate: ("Main Plate", ["Grilled Chicken", "Brown Rice"]),
          juice: ("Juice", ["Lemonade"]),
          salad: ("Salad", ["Caesar Salad"]),
          fruits: ("Fruit", ["Banana"])
        )
      ],
      activity: [
        Activity(
          id: UUID(),
          title: "Morning Jog",
          description: "Ran for 30 minutes around the park.",
          image: UIImage()
        ),
        Activity(
          id: UUID(),
          title: "Yoga",
          description: "Did a relaxing yoga session for 45 minutes.",
          image: UIImage()
        )
      ],
      classID: UUID()
    )
}

struct FoodMenu: Identifiable {
  var id: UUID
  var title: String
  var portion: (title: String, description: [String])
  var mainPlate: (title: String, description: [String])
  var juice: (title: String, description: [String])
  var salad: (title: String, description: [String])
  var fruits: (title: String, description: [String])
}

struct Activity: Identifiable {
  var id: UUID
  var title: String
  var description: String
  var image: UIImage
}
