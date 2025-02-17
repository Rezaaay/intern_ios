//
//  StudentService.swift
//  intern_ios
//
//  Created by Naufal Fachreza on 17/02/25.
//

import Foundation

class StudentService {
    static func fetchStudents() -> [Student] {
        let jsonString = """
        [
          {
            "name": "Rizky Aditya",
            "profilePhoto": "https://randomuser.me/api/portraits/men/1.jpg",
            "address": "Jl. Merdeka No.10, Jakarta"
          },
          {
            "name": "Nadia Safitri",
            "profilePhoto": "https://randomuser.me/api/portraits/women/2.jpg",
            "address": "Jl. Sudirman No.25, Bandung"
          },
          {
            "name": "Budi Santoso",
            "profilePhoto": "https://randomuser.me/api/portraits/men/3.jpg",
            "address": "Jl. Gajah Mada No.7, Surabaya"
          },
          {
            "name": "Siti Aisyah",
            "profilePhoto": "https://randomuser.me/api/portraits/women/4.jpg",
            "address": "Jl. Diponegoro No.12, Yogyakarta"
          },
          {
            "name": "Andi Wijaya",
            "profilePhoto": "https://randomuser.me/api/portraits/men/5.jpg",
            "address": "Jl. Ahmad Yani No.33, Medan"
          },
          {
            "name": "Dewi Lestari",
            "profilePhoto": "https://randomuser.me/api/portraits/women/6.jpg",
            "address": "Jl. Raden Saleh No.18, Semarang"
          },
          {
            "name": "Fajar Pratama",
            "profilePhoto": "https://randomuser.me/api/portraits/men/7.jpg",
            "address": "Jl. Thamrin No.22, Makassar"
          },
          {
            "name": "Lina Susanti",
            "profilePhoto": "https://randomuser.me/api/portraits/women/8.jpg",
            "address": "Jl. Malioboro No.5, Yogyakarta"
          },
          {
            "name": "Arief Hidayat",
            "profilePhoto": "https://randomuser.me/api/portraits/men/9.jpg",
            "address": "Jl. Gatot Subroto No.45, Bali"
          },
          {
            "name": "Tania Rahmadani",
            "profilePhoto": "https://randomuser.me/api/portraits/women/10.jpg",
            "address": "Jl. Dipati Ukur No.27, Bandung"
          }
        ]

        """
        
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                return try JSONDecoder().decode([Student].self, from: jsonData)
            } catch {
                print("Error decoding JSON: \(error)")
                return []
            }
        }
        
        return []
    }
}
