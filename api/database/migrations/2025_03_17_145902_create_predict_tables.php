<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        // Predict Matches Table
        Schema::create('predict_matches', function (Blueprint $table) {
            $table->id();
            $table->dateTime('start_date');
            $table->dateTime('end_date');
            $table->timestamps();
        });

        // Predict Teams Table
        Schema::create('predict_teams', function (Blueprint $table) {
            $table->id();
            $table->integer('predict_match_id')->nullable();
            $table->integer('country_id')->nullable();
            $table->timestamps();
        });

        // Predict Players Table
        Schema::create('predict_players', function (Blueprint $table) {
            $table->id();
            $table->integer('predict_match_id')->nullable();
            $table->integer('predict_team_id')->nullable();
            $table->integer('player_id')->nullable(); // Player Relation
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('predict_players');
        Schema::dropIfExists('predict_teams');
        Schema::dropIfExists('predict_matches');
    }
};
