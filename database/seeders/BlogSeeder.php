<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class BlogSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
{
    \App\Models\User::factory()->create(['email' => 'test@test.com']);
    \App\Models\Blog::factory(10)->create();
}

}
