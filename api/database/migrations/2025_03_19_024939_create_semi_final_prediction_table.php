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
        Schema::create('semifinal', function (Blueprint $table) {
            $table->id();
            $table->integer('match_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('team_id')->nullable();
            $table->integer('match')->nullable();
            $table->integer('win')->nullable();
            $table->integer('los')->nullable();
            $table->integer('tie')->nullable();
            $table->integer('pts')->nullable();
            $table->integer('status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('semifinal');
    }
};
