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
        Schema::create('match_list', function (Blueprint $table) {
            $table->id();
            $table->integer('team_a')->nullable();
            $table->integer('team_b')->nullable();
            $table->dateTime('time')->nullable();
            $table->integer('match_type')->nullable()->comment('1=oneday, 2= t20, 3=championship, 4=test, 5=worldcup');
            $table->string('game_type')->nullable()->comment('football,cricket,buscatball,tanis');
            $table->integer('status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('match_list');
    }
};
