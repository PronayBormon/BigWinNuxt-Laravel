<?php

namespace App\Http\Controllers\User;

use App\Models\MatchRun;
use App\Models\User;
use App\Models\SiteSetting;
use App\Models\Boller;
use App\Models\Batsman;
use App\Models\Country;
use App\Models\Players;
use App\Models\MatchList;
use App\Models\Tournament;
use App\Models\TeamPlayers;
use Illuminate\Http\Request;
use App\Models\TournamentTeam;
use App\Http\Controllers\Controller;
use App\Models\PredictMatch;
use App\Models\PredictPlayer;
use App\Models\PredictTeam;
use App\Models\singleMatchReport;
use App\Models\TournamentTeamsPlayers;
use Illuminate\Support\Facades\Validator;

class UnauthenticateController extends Controller
{
    private function generatePaginationLinks($data)
    {
        $links = [];
        $currentPage = $data->currentPage();
        $lastPage = $data->lastPage();

        if ($currentPage > 1) {
            $links[] = ['label' => 'Prev', 'url' => $data->url($currentPage - 1)];
        }

        $links[] = ['label' => 1, 'url' => $data->url(1), 'active' => $currentPage == 1];

        if ($currentPage > 3) {
            $links[] = ['label' => '...', 'url' => null];
        }

        for ($i = max(2, $currentPage - 1); $i <= min($lastPage - 1, $currentPage + 1); $i++) {
            $links[] = ['label' => $i, 'url' => $data->url($i), 'active' => $i == $currentPage];
        }

        if ($currentPage < $lastPage - 2) {
            $links[] = ['label' => '...', 'url' => null];
        }

        if ($lastPage > 1) {
            $links[] = ['label' => $lastPage, 'url' => $data->url($lastPage), 'active' => $currentPage == $lastPage];
        }

        if ($currentPage < $lastPage) {
            $links[] = ['label' => 'Next', 'url' => $data->url($currentPage + 1)];
        }

        return $links;
    }

    public function user_list()
    {
        $user = User::where('role', '1')
            // ->with(['batsman', 'boller'])
            ->get();
        return response()->json($user);
    }
    public function teamList($id)
    {

        $matchList = PredictMatch::where('id', $id)
            ->with(['teams', 'teams.country'])
            ->first();
        return response()->json($matchList);
    }
    public function addBatsman(Request $request)
    {
        $validated = $request->validate([
            'match_id' => 'required',  // Assuming `match_list` is the name of the matches table
            'team_id' => 'required',  // Assuming `teams` is the name of the teams table
            'user_id' => 'required',  // Assuming `teams` is the name of the teams table
            'player_id' => 'required',
            'run' => 'required|integer',
            'ball' => 'required|integer',
            'four' => 'required|integer',
            'six' => 'required|integer',
        ]);

        // Save the data in the batsman or boller table based on the request (assuming you're saving to the Batsman table)
        $batsman = Batsman::create([
            'match_id' => $validated['match_id'],
            'user_id' => $validated['user_id'],
            'team_id' => $validated['team_id'],
            'player_id' => $validated['player_id'],
            'run' => $validated['run'],
            'ball' => $validated['ball'],
            'total_4' => $validated['four'],
            'total_6' => $validated['six'],
        ]);

        $bowler = Boller::where('user_id', $request->user_id)->where('match_id', $request->match_id)->first();

        if ($bowler != null) {
            $settings = SiteSetting::first();
            $user = User::where('id', $request->user_id)->first();
            $creadit = $user->Credit_Points;
            $total = $settings->single_match_bonus + $creadit;
            $user->update([
                'Credit_Points' => $total,
            ]);
        }

        return response()->json(['message' => 'Player stats saved successfully!', 'data' => $batsman], 201);
    }

    public function addBowler(Request $request)
    {
        // Validate the incoming request
        $validated = $request->validate([
            'match_id' => 'required ',  // Ensure match exists in match_list table
            'user_id' => 'required',  // Ensure user exists in users table
            'team_id' => 'required',  // Ensure team exists in teams table
            'player_id' => 'required',
            'over' => 'required|numeric',
            'maden_over' => 'required|numeric',
            'run' => 'required|numeric',
            'wicket' => 'required|numeric',
        ]);

        // Save the bowler data
        $bowler = Boller::create([
            'match_id' => $validated['match_id'],
            'user_id' => $validated['user_id'],
            'team_id' => $validated['team_id'],
            'player_id' => $validated['player_id'],
            'over' => $validated['over'],
            'maden_over' => $validated['maden_over'],
            'run' => $validated['run'],
            'wicket' => $validated['wicket'],
        ]);

        
        $batsman = Batsman::where('user_id', $request->user_id)->where('match_id', $request->match_id)->first();

        if ($batsman != null) {
            $settings = SiteSetting::first();
            $user = User::where('id', $request->user_id)->first();
            $creadit = $user->Credit_Points;
            $total = $settings->max_predict_bonus + $creadit;
            $user->update([
                'Credit_Points' => $total,
            ]);
        }

        // Return a response indicating success
        return response()->json([
            'message' => 'Bowler stats saved successfully!',
            'data' => $bowler
        ], 201);
    }
    public function batsmanMatch($id)
    {
        $batsmen = Batsman::where('match_id', $id)
            ->orderby('id', 'desc')
            ->with(['user', 'team.country', 'match', 'TeamPlayers'])
            ->get()
            ->unique('user_id')
            ->values();

        // dd($batsmen);

        return response()->json([
            'data' => $batsmen,
            'message' => 'Success'
        ]);
    }
    public function ballerMatch($id)
    {
        $batsmen = Boller::where('match_id', $id)
            ->orderby('boller.id', 'desc')
            ->with(['user', 'team'])
            ->get()
            ->unique('user_id')
            ->values();

        return response()->json([
            'data' => $batsmen,
            'message' => 'Success'
        ]);
    }


    public function batsman(request $request)
    {
        $data = Batsman::where('match_id', $request->matchId)->where('user_id', $request->userId)->orderby('id', 'desc')->with('TeamPlayers.player')->get();
        return response()->json($data);
    }
    public function bowlers(request $request)
    {

        $data = Boller::where('match_id', $request->matchId)->where('user_id', $request->userId)

            ->with(['user', 'team', 'match', 'TeamPlayers', 'TeamPlayers.player'])
            ->orderby('id', 'desc')->get();

        return response()->json($data);
    }
    public function singleMatchData($id)
    {
        //  dd($id);
        $data = MatchList::where('id', $id)
            ->with(['teamA', 'teamB'])
            ->first();
        return response()->json($data);
    }
    public function player_list(Request $request, $id)
    {
        $query = Players::where('match_id', $id)->with('team');

        // Filter by status
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // Filter by team name
        if ($request->filled('searchInput')) {
            $query->whereHas('team', function ($q) use ($request) {
                $q->where('name', 'like', "%{$request->searchInput}%");
            })
                ->orWhere('palyer_name', 'like', "%{$request->searchInput}%");
        }

        // Paginate data
        $data = $query->orderby('id', 'desc')->paginate($request->items ?? 10);

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
    // ========== Team list for select ==========
    public function countryList()
    {

        $data = Country::where('status', '1')->orderBy('name', 'asc')->get();
        return response()->json($data);
    }
    public function tournamentList(request $request)
    {

        $query = Tournament::query();

        if ($request->has('search')) {
            $query->where('name', 'like', "%{$request->search}%");
        }

        $data = $query->orderBy('id', 'desc')->paginate($request->items ?? 10);

        $data->getCollection()->transform(function ($item) {
            $item->start_date = $item->start_date ? \Carbon\Carbon::parse($item->start_date)->format('d M Y h:i A') : null;
            $item->end_date = $item->end_date ? \Carbon\Carbon::parse($item->end_date)->format('d M Y h:i A') : null;
            return $item;
        });

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }

    public function tournamentTeamList(Request $request, $id)
    {
        // Start query for TournamentTeam filtering by tournament_id
        $query = TournamentTeam::where('tournament_id', $id);

        // Filter by status if provided
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // Filter by team name if search input is provided
        if ($request->has('searchInput')) {
            $searchInput = $request->searchInput;

            $query->where(function ($q) use ($searchInput) {
                // Search within teams
                $q->whereHas('team', function ($teamQuery) use ($searchInput) {
                    $teamQuery->where('name', 'like', "%{$searchInput}%");
                })
                    // OR search within tournaments
                    ->orWhereHas('tournament', function ($tournamentQuery) use ($searchInput) {
                        $tournamentQuery->where('name', 'like', "%{$searchInput}%");
                    });
            });
        }

        // Paginate results with default 10 items per page
        $data = $query->with(['tournament', 'team'])->orderBy('id', 'desc')->paginate($request->items ?? 10);

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
    public function removeTeam(request $request)
    {
        $validate = Validator::make($request->all(), [
            "tournament_id"     => "required",
            "team_id"           => "required",
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors(),], 401);
        }

        $data = TournamentTeam::where("tournament_id", $request->tournament_id)->where("team_id", $request->team_id)->first();

        // dd($data);
        $delete = $data->delete();

        if ($delete) {
            return response()->json(['message' => "Suceefully deleted"]);
        }
    }

    public function playerlist()
    {
        $data = TeamPlayers::get();
        return response()->json($data);
    }
    public function tournamentPlayers(Request $request)
    {
        $query = TournamentTeamsPlayers::where('tournament_team_id', $request->teamId)
            ->where('tournament_id', $request->tournamentId)
            ->with(['player']);

        // Filter by status if provided
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        // Search by player name or tournament name
        if ($request->filled('searchInput')) {
            $searchInput = $request->searchInput;

            $query->whereHas('player', function ($q) use ($searchInput) {
                $q->where('player_name', 'like', "%{$searchInput}%");
            })->orWhereHas('tournament', function ($q) use ($searchInput) {
                $q->where('name', 'like', "%{$searchInput}%");
            });
        }

        // Paginate with sorting
        $data = $query->paginate($request->items ?? 10);
        $data->getCollection()->sortBy('player.player_name');

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }



    public function makeSiglePredict(request $request)
    {
        // Validate input
        $validate = Validator::make($request->all(), [
            'match_id' => 'required|numeric',
            'user_id'  => 'required|numeric',
            'team_id'  => 'required|numeric',
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()]);
        }

        // Check if prediction already exists
        $check = singleMatchReport::where('match_id', $request->match_id)
            ->where('user_id', $request->user_id)
            ->first();

        if ($check == null) {
            // Create prediction
            $data = singleMatchReport::create([
                'match_id' => $request->match_id,
                'user_id'  => $request->user_id,
                'predict_team_id' => $request->team_id,
            ]);

            if (!$data) {
                return response()->json(['error' => 'Error creating prediction']);
            }

            if ($data) {

                $settings = SiteSetting::first();
                $user = User::where('id', $request->user_id)->first();
                $creadit = $user->Credit_Points;
                $total = $settings->single_match_bonus + $creadit;
                $user->update([
                    'Credit_Points' => $total,
                ]);
            }

            // Create match run record
            $makeRun = MatchRun::create([
                'match_id' => $request->match_id,
                'user_id'  => $request->user_id,
                'run'      => "00",
            ]);


            if (!$makeRun) {
                return response()->json(['error' => 'Error creating match run']);
            }

            return response()->json(['message' => 'Prediction successfully added']);
        } else {
            return response()->json(['error' => 'Prediction already exists']);
        }
    }

    public function maxPredictPlayers(request $request)
    {
        // dd($request->all());
        //  "match_id" => "7"
        // "team_id" => "10"
        $data = PredictPlayer::where('predict_match_id', $request->match_id)->where('predict_team_id', $request->team_id)->with(["player"])->get();
        // dd($data);
        return response()->json($data);
    }
}
