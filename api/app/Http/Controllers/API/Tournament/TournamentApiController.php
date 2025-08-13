<?php

namespace App\Http\Controllers\API\Tournament;

use App\Http\Controllers\Controller;
use App\Models\ChampionResult;
use App\Models\FinalistResult;
use App\Models\SemiFinalResult;
use App\Models\Tournament;
use Illuminate\Http\Request;

class TournamentApiController extends Controller
{
    public function tournamentResult(Request $request, $id)
    {
        $exists = Tournament::find($id);
        if (!$exists) {
            return response()->json([
                'status' => true,
                'code' => 404,
                'message' => 'Tournament not found',
            ], 404);
        }

        $champion = ChampionResult::where('match_id', $id)->with('match', 'team.country', 'manot.player')->first();
        $semi = SemiFinalResult::where('match_id', $id)->with('team.team')->get();
        $final = FinalistResult::where('match_id', $id)->with('team1.team', 'team2.team', 'highscore.player')->first();

        if (!$champion || !$semi || !$final) {
            return response()->json([
                'status' => true,
                'code' => 404,
                'message' => 'Result not publish yet',
            ], 404);
        }

        return response()->json([
            'status' => true,
            'code' => 200,
            'message' => 'Success',
            'champion' => $champion,
            'champion' => [
                'mot' => $champion->manot->player->player_name??'',
                'team' => $champion->team->country->name??'',
            ],
            'semi' => $semi->map(function ($item) {
                return [
                    'team' => $item->team->team->name??'',
                    'win' => $item->win??'',
                    'pts' => $item->pts??'',
                ];
            }),
            'finals' => [
                'hs' => $final->highscore?->player->player_name??'',
                'teamA' => $final->team1?->team->name??'',
                'teamB' => $final->team2?->team->name??'',
            ],
        ],200);
    }
}
