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
        Schema::create('match_report', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->nullable();
            $table->integer('match_id')->nullable();
            $table->integer('predict_team_id')->nullable();
            $table->integer('predict_status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('match_report');
    }
};
