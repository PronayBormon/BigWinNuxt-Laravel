<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('batsman', function (Blueprint $table) {
            $table->id();
            $table->foreignId('match_id')->constrained('match_list')->onDelete('cascade');
            $table->foreignId('team_id')->constrained('countries')->onDelete('cascade'); // Corrected from 'tema_id'
            $table->string('player_name');
            $table->integer('run')->default(0);
            $table->integer('ball')->default(0);
            $table->integer('total_4')->default(0);
            $table->integer('total_6')->default(0);
            $table->string('status')->default('not out');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('batsman');
    }
};
