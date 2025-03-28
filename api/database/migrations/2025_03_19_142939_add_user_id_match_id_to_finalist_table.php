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
        Schema::table('finalist', function (Blueprint $table) {
            $table->integer('match_id')->after('id')->nullable();
            $table->integer('user_id')->after('id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finalist', function (Blueprint $table) {
            $table->dropColumn('match_id');
            $table->dropColumn('user_id');
        });
    }
};
