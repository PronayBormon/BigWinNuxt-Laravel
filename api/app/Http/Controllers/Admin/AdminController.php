<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\Slider;
use App\Models\Players;
use App\Models\SpinList;
use App\Models\MatchList;
use App\Models\Tournament;
use App\Models\PredictTeam;
use App\Models\PrizeBanner;
use App\Models\TeamPlayers;
use App\Models\Notification;
use App\Models\PredictMatch;
use Illuminate\Http\Request;
use App\Models\PredictPlayer;
use App\Models\TournamentTeam;
use App\Http\Controllers\Controller;
use App\Models\TournamentTeamsPlayers;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    // 🔹 **Generate Pagination Links with Ellipsis**
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

    public function addPrizeBanner(Request $request)
    {
        // dd($request->all());
        $validate = Validator::make($request->all(), [
            'name' => 'required||string',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'type' => 'integer||required',
        ]);
        if ($validate->fails()) {
            return response()->json($validate->errors());
        }

        if ($request->hasFile('image')) {

            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $imageName);

            $query = PrizeBanner::create([
                'name' => $request->name,
                'type' => $request->type,
                'banner' => $imageName,
                'status' => '1',
            ]);

            return response()->json([
                'message' => "Success",
                'data' => $query,
            ]);
        }
    }
    public function PrizeBanner()
    {
        $BattingprizeBanner = PrizeBanner::where('type', '1')->orderby('id', "desc")->first();
        $BowlingprizeBanner = PrizeBanner::where('type', '2')->orderby('id', "desc")->first();
        $TournamentprizeBanner = PrizeBanner::where('type', '3')->orderby('id', "desc")->first();

        return response()->json([
            'batting' => $BattingprizeBanner ? array_merge($BattingprizeBanner->toArray(), [
                'image' => url('uploads/' . $BattingprizeBanner->banner)
            ]) : null,

            'bowling' => $BowlingprizeBanner ? array_merge($BowlingprizeBanner->toArray(), [
                'image' => url('uploads/' . $BowlingprizeBanner->banner)
            ]) : null,

            'tournament' => $TournamentprizeBanner ? array_merge($TournamentprizeBanner->toArray(), [
                'image' => url('uploads/' . $TournamentprizeBanner->banner)
            ]) : null,
        ]);
    }
    public function newspin(request $request)
    {

        $validated = Validator::make($request->all(), [
            'name' => 'required|string',
            'prize' => 'required|string',
        ]);
        if ($validated->fails()) {
            return response()->json([
                'errors' => $validated->errors(),
            ], 401);
        }

        $save = SpinList::create([
            'name' => $request->name,
            'prize' => $request->prize,
            'status' => '1',
        ]);

        if ($save) {

            return response()->json([
                'message' => "success",
                'data' => $save,
            ]);
        }
    }
    public function SpinList(Request $request)
    {
        $query = SpinList::query();

        // Apply search filter
        if ($request->has('searchInput') && !empty($request->searchInput)) {
            $query->where('name', 'like', '%' . $request->searchInput . '%');
        }

        // Apply status filter
        if ($request->has('status') && $request->status !== null) {
            $query->where('status', $request->status);
        }

        // Apply pagination (default 10 items per page)
        $data = $query->orderBy('id', 'desc')->paginate($request->items ?? 10);

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



    public function getspin($id)
    {
        $data = SpinList::where('id', $id)->first();
        return response()->json($data);
    }

    public function updateSpin(request $request)
    {

        $validated = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required|string',
            'prize' => 'required|string',
            'status' => 'required',
        ]);
        if ($validated->fails()) {
            return response()->json([
                'errors' => $validated->errors(),
            ], 401);
        }

        $data = SpinList::where('id', $request->id)->first();

        $save = $data->update([
            'name' => $request->name,
            'prize' => $request->prize,
            'status' => $request->status,
        ]);

        if ($save) {

            return response()->json([
                'message' => "success",
                'data' => $save,
            ]);
        }
    }

    public function newMessage(request $request)
    {

        $validator = Validator::make($request->all(), [
            'message' => 'required|min:5',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }

        $data = Notification::create([
            'message' => $request->message,
            'status' => "1",
        ]);

        if ($data) {
            return response()->json(['message' => 'success']);
        }
    }
    public function messageList(Request $request)
    {
        $query = Notification::query();

        // Apply search filter if 'searchInput' is present (use 'has' instead of 'hasFile')
        if ($request->has('searchInput')) {
            $query->where('message', 'like', '%' . $request->searchInput . '%');
        }

        $data = $query->orderBy('id', 'desc')->paginate($request->items);

        $data->getCollection()->transform(function ($item) {
            $item->created = $item->created_at->format('d M Y h:i A');
            return $item;
        });
        // dd($data);

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
    public function messageDetails($id)
    {
        $data = Notification::where('id', $id)->first();
        return response()->json($data);
    }
    public function updateMessage(request $request)
    {

        $data = Notification::where('id', $request->id)->first();
        $data->update([
            'message' => $request->message,
        ]);

        return response()->json([
            'message' => "success",
        ]);
    }

    public function addSlider(request $request)
    {

        $validate = Validator::make($request->all(), [
            'image' => 'required|mimes:jpg,png,jpeg,webp',
        ]);
        if ($validate->fails()) {
            return response()->json([
                'error' => $validate->errors(),
            ], 401);
        }

        if ($request->hasFile('image')) {

            $image = $request->file('image');
            $fileName = rand() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $fileName);

            $data = Slider::create([
                'image' => $fileName,
            ]);

            return response()->json([
                'message' => "success"
            ]);
        } else {
            return response()->json([
                'message' => "Image Not Found"
            ]);
        }
    }

    public function sliderList()
    {
        $data =  Slider::orderby('id', 'desc')->get();

        $data->transform(function ($item) {
            $item->banner = url('uploads/' . $item->image);
            return $item;
        });

        return response()->json($data);
    }
    public function deleteSlider($id)
    {
        $data = Slider::find($id);

        if (!$data) {
            return response()->json(['message' => "Slider not found."], 404);
        }

        $data->delete();

        return response()->json(['message' => "Successfully deleted."], 200);
    }
    public function matchDetails($id)
    {

        $data = MatchList::where('id', $id)->first();

        return response()->json($data);
    }
    public function update_match(request $request)
    {
        $data = MatchList::where('id', $request->id)->first();

        $data->update([
            'team_a' => $request->teamA,
            'team_b' => $request->teamB,
            'time' => $request->startDate,
            'end_date' => $request->endDate,
            'status' => $request->status,
        ]);

        return response()->json(['message' => "successfully Update"]);
    }


    public function saveTournament(Request $request)
    {

        $teams = collect($request->teams)->map(function ($team) {
            return json_decode($team, true);
        })->toArray();

        // Replace the request input with properly formatted teams
        $request->merge(['teams' => $teams]);

        // Validate the request
        $Validate = $request->validate([
            'tname' => 'required|string',
            'tdate' => 'required|date',
            'tenddate' => 'required|date',
            'teams' => 'required|array|min:1',
            'teams.*.team_id' => 'required|integer|exists:countries,id', // Ensure team exists
            'teams.*.players' => 'required|array|min:1',
            'teams.*.players.*' => 'required|integer|exists:team_players,id', // Ensure players exist
        ]);


        // Create the tournament
        $tournament = Tournament::create([
            'name' => $request->tname,
            'start_date' => $request->tdate,
            'end_date' => $request->tenddate,
            'status' => '1',
        ]);

        // Save teams and players
        foreach ($request->teams as $teamData) {
            $tournamentTeam = TournamentTeam::create([
                'tournament_id' => $tournament->id,
                'team_id' => $teamData['team_id'],
                'status' => '1',
            ]);

            // Save players in TournamentTeamsPlayers
            foreach ($teamData['players'] as $playerId) {
                TournamentTeamsPlayers::create([
                    'tournament_id' => $tournament->id,
                    'tournament_team_id' => $tournamentTeam->id,
                    'player_id' => $playerId,
                ]);
            }
        }

        return response()->json([
            'message' => 'Tournament, teams, and players created successfully',
            'tournament' => $tournament,
        ]);
    }

    public function tournamentDetails($id)
    {
        $data = Tournament::where('id', $id)
            ->with('teams')
            ->first();
        return response()->json($data);
    }
    public function UpdateTournament(Request $request)
    {
        // Validate the request
        $request->validate([
            'name'       => 'required|string|max:255',
            'start_date' => 'required|date',
            'end_date'   => 'required|date|after_or_equal:start_date',
            'status'     => 'required|in:0,1,2',
        ]);

        $tournament = Tournament::where("id", $request->id)->first();

        // dd($tournament);

        $tournament->update([
            "name"       => $request->name,
            "start_date" => $request->start_date,
            "end_date"   => $request->end_date,
            "status"     => $request->status,
        ]);

        return response()->json([
            'message' => 'Tournament updated successfully!',
            'tournament' => $tournament,
        ]);
    }
    public function addTournamentTeam(Request $request)
    {
        // Validate request data
        $validate = Validator::make($request->all(), [
            'tournament_id' => 'required|integer|exists:tournaments,id',
            'teams'         => 'required|array',
            'teams.*'       => 'integer|exists:countries,id', // Validate that each team ID exists in the teams table
        ]);
        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        $tournamentId = $request->tournament_id;
        $addedTeams = [];
        foreach ($request->teams as $teamId) {
            $teamId = (int) $teamId;
            $exists = TournamentTeam::where('tournament_id', $tournamentId)
                ->where('team_id', $teamId)
                ->exists();

            if (!$exists) {
                TournamentTeam::create([
                    'tournament_id' => $tournamentId,
                    'team_id'       => $teamId,
                    'status'        => 1, // Assuming "1" is an active status
                ]);
                $addedTeams[] = $teamId; // Add the team to the added list
            }
        }

        // If no teams were added, return a message indicating that
        if (empty($addedTeams)) {
            return response()->json(['message' => "No new teams added. All teams were already registered."], 200);
        }

        // Return success message and list of added teams
        return response()->json(['message' => "Teams added successfully!", 'added_teams' => $addedTeams]);
    }
    public function addNewPlayer(Request $request)
    {
        // Remove the dd() line
        // dd($request->all());

        $validate = Validator::make($request->all(), [
            // "team_id"       => "integer|required",
            "player_name"   => "string|required",
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        $data = TeamPlayers::create([
            'player_name' => $request->player_name,
            'status' => "1",
        ]);

        return response()->json(['message' => "Player successfully added", 'data' => $data], 201);
    }
    public function teamPlayers(request $request)
    {

        $query = teamPlayers::query();
        // $data = teamPlayers::orderBy('id', 'desc')->query();  

        if ($request->filled('searchInput')) {
            $query->where('player_name', 'like', '%' . $request->searchInput . '%');
        }
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }
        $data = $query->orderby('id', 'desc')->paginate($request->items);
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
    public function playerDetails($id)
    {
        $data = teamPlayers::where('id', $id)->first();
        return response()->json($data);
    }
    public function updatePlayer(request $request)
    {
        // dd($request->all());
        $player = teamPlayers::where('id', $request->player_id)->first();

        $player->update([
            "player_name"   => $request->player_name,
            "status"        => $request->status,
        ]);

        return response()->json(['message' => "Player successfully Update"], 201);
    }

    public function maxpredict(Request $request)
    {
        // Log the incoming request data for debugging purposes

        // Validate the request
        $request->validate([
            'start_date' => 'required',
            'end_date' => 'required',
            'teams' => 'required|array',
            'teams.*.team_id' => 'required', // Ensure team exists
            'teams.*.players' => 'required|array|min:15',
            // 'teams.*.players.*' => 'exists,id'
        ]);

        // Create Match
        $match = PredictMatch::create([
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
        ]);
        // dd($request->teams);

        // Attach Teams and Players
        foreach ($request->teams as $teamData) {

            // dd($teamData);

            $team = PredictTeam::create([
                'predict_match_id' =>  $match->id,
                'country_id' => $teamData['team_id'],
            ]);


            foreach ($teamData['players'] as $playerId) {
                PredictPlayer::create([
                    'predict_match_id' => $match->id,
                    'predict_team_id' => $team->id,
                    'player_id' => $playerId,
                ]);
            }
        }

        return response()->json(['message' => 'Predict Match created successfully!'], 201);
    }

    public function maxpredictList(request $request)
    {
        // $data = PredictMatch::with(['teams', 'teams.country'])
        //     ->orderBy('id', 'desc')
        //     ->get();

        $query = PredictMatch::with(['teams', 'teams.country']); // No need for ->query()

        if ($request->filled('searchInput')) {
            $query->whereHas('teams.country', function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->searchInput . '%');
            });
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $data = $query->orderBy('id', 'desc')->paginate($request->items);

        $data->getCollection()->transform(function ($match) {
            $match->start_date = Carbon::parse($match->start_date)->format('d M Y, h:i A');
            $match->end_date = Carbon::parse($match->end_date)->format('d M Y, h:i A');
            return $match;
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

    public function maxpredictPlayerList(request $request){
        $query = PredictPlayer::where('predict_match_id', $request->id)->with(['player','team','team.country','match']);

        
        if ($request->filled('searchInput')) {
            $query->whereHas('team', function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->searchInput . '%');
            });
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $data = $query->orderBy('id', 'desc')->paginate($request->items);
        
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
}
