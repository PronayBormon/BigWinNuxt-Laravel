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
            $table->foreignId('match_id')->constrained('match_list')->onDelete('cascade');
            $table->foreignId('team_id')->constrained('countries')->onDelete('cascade');
            $table->string('player_name');
            $table->integer('over');
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
