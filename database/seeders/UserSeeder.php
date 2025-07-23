<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
         User::create([
            'name' => 'Vishal',
            'email' => 'vishal1@vishal.com',
            'password' => Hash::make('Demo@123'),
        ]);
        User::create([
            'name' => 'Test User',
            'email' => 'test@vishal.com',
            'password' => Hash::make('Vishal@123'),
        ]);

        User::create([
            'name' => 'Demo User',
            'email' => 'demo@vishal.com',
            'password' => Hash::make('Demo@123'),
        ]);
        
    }
}
