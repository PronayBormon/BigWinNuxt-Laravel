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
            $table->integer('match_id')->nullable();
            $table->integer('team_id')->nullable();
            $table->integer('player_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('run')->default(0);
            $table->integer('ball')->default(0);
            $table->integer('total_4')->default(0);
            $table->integer('total_6')->default(0);
            $table->string('status')->default(0);
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
