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
        Schema::create('batsmanResult', function (Blueprint $table) {
            $table->id();
            $table->integer('match_id')->nullable();
            $table->integer('team_id')->nullable();
            $table->integer('player_id')->nullable();
            $table->integer('run')->nullable();
            $table->integer('ball')->nullable();
            $table->integer('total_4')->nullable();
            $table->integer('total_6')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('batsmanResult');
    }
};
