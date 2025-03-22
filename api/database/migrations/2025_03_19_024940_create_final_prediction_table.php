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
        Schema::create('finalist', function (Blueprint $table) {
            $table->id();
            $table->integer('team_one')->nullable();
            $table->integer('team_two')->nullable();
            $table->integer('hwt')->nullable();
            $table->integer('hs')->nullable();
            $table->integer('status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finalist');
    }
};
