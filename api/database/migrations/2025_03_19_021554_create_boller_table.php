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
        Schema::create('boller', function (Blueprint $table) {
            $table->id();
            $table->integer('match_id')->nullable();
            $table->integer('team_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('player_id')->nullable();
            $table->integer('over')->nullable();
            $table->integer('maden_over')->default(0);
            $table->integer('run')->default(0);
            $table->integer('wicket')->default(0);
            $table->integer('status')->default('1');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('boller');
    }
};
