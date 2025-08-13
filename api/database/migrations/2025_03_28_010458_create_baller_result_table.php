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
        Schema::create('ballerresult', function (Blueprint $table) {
            $table->id();
            $table->integer('match_id')->nullable();
            $table->integer('team_id')->nullable();
            $table->integer('player_id')->nullable();
            $table->integer('over')->nullable();
            $table->integer('maden_over')->nullable();
            $table->integer('run')->nullable();
            $table->integer('wicket')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ballerResult');
    }
};
