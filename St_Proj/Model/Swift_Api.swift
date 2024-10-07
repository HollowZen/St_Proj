//
//  Repository.swift
//  St_Proj
//
//  Created by user on 10.10.2024.
//

import Foundation

import Supabase

class Swift_Api {
    // паттерн instance
    static let instance = Swift_Api()
    
    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://dpwzvrrzhvqfjqtvgnop.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwd3p2cnJ6aHZxZmpxdHZnbm9wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0Mzg3NTQsImV4cCI6MjA0NDAxNDc1NH0.4mSOyWbZaL7v-9w1N_rtw0dR8dY-M8Ya6nQFkpRyX1s",
        options: .init())
    
    // регистрация в supabase
    func signUp(name: String, phone: String, email: String, password: String) async throws {
        try await supabase.auth.signUp(email: email, password: password)
        
        let user = try await supabase.auth.session.user
        
        let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
        
        try await supabase.database.from("users")
            .insert(newUser)
            .execute()
        
        try await supabase.auth.signOut()
    }
}
